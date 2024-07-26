import 'package:zaracast/src/core/errors/exceptions.dart';
import 'package:zaracast/src/core/utils/dio/dio_network.dart';
import 'package:zaracast/src/core/utils/podcast_index_api.dart';
import 'package:zaracast/src/features/podcast/data/models/podcast_model.dart';
import 'package:zaracast/src/features/podcast/domain/entities/podcast_entity.dart';
import 'package:zaracast/src/features/search/data/params/search_podcasts_params.dart';

// ignore: one_member_abstracts
abstract class SearchRemoteDataSource {
  Future<List<PodcastEntity>> searchPodcasts(SearchPodcastsParams params);
}

// This is where all errors should be caught and converted to LocalExceptions.
// Do not print errors here.
class SearchRemoteDataSourceImpl implements SearchRemoteDataSource {
  SearchRemoteDataSourceImpl({
    required this.dio,
    required this.podcastIndex,
  });

  final DioNetwork dio;
  final PodcastIndex podcastIndex;

  @override
  Future<List<PodcastModel>> searchPodcasts(
    SearchPodcastsParams params,
  ) async {
    final arguments = {
      'searchTerm': params.searchTerm,
      'maxResults': params.maxResults,
    };

    try {
      final response = await dio.get<Map<String, dynamic>>(
        'search/byterm',
        podcastIndex.buildHeaders,
        queryParameters: params.toJson(),
      );

      if (response.statusCode != 200) {
        final responseCode = response.statusCode ?? 999;
        final statusMessage = response.statusMessage ??= 'No status message';

        throw ServerException.badRequest(
          responseCode: responseCode,
          statusMessage: statusMessage,
          arguments: arguments,
        );
      }

      final data = response.data;

      if (data == null) {
        throw ServerException.emptyResponse(arguments: arguments);
      }

      final feeds = data['feeds'];

      if (feeds is! List<dynamic>) {
        throw ServerException.unexpectedDataFormat(
          expectedType: List<dynamic>,
          receivedType: feeds.runtimeType,
          arguments: arguments,
        );
      }

      // Map feeds to a PodcastModel and filter out the podcasts based on the
      // filterPodcast() function. Then sort the podcasts by newestItemPubdate.
      //
      // TODO(red): Add an additional sort by popularity
      final podcastModels = feeds
          .whereType<Map<String, dynamic>>()
          .map(PodcastModel.fromJson)
          .where(filterPodcast)
          .toList()
        ..sort(
          (a, b) =>
              (b.newestItemPubdate ?? 0).compareTo(a.newestItemPubdate ?? 0),
        );

      return podcastModels;
    } catch (e, stackTrace) {
      throw ServerException.unknownError(stackTrace: stackTrace);
    }
  }

  bool filterPodcast(PodcastModel model) {
    return model.dead != 1 &&
        model.episodeCount >= 1 &&
        model.medium == 'podcast';
  }
}
