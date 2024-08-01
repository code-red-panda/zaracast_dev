import 'package:json_annotation/json_annotation.dart';
import 'package:zaracast/src/features/podcast/domain/entities/podcast_entity.dart';

part 'podcast_model.g.dart';

@JsonSerializable()
class PodcastModel extends PodcastEntity {
  const PodcastModel({
    required super.id,
    required super.podcastGuid,
    required super.title,
    required super.url,
    required super.originalUrl,
    required super.link,
    required super.description,
    required super.author,
    required super.ownerName,
    required super.image,
    required super.artwork,
    required super.lastUpdateTime,
    required super.lastCrawlTime,
    required super.lastParseTime,
    required super.lastGoodHttpStatusTime,
    required super.lastHttpStatus,
    required super.contentType,
    required super.language,
    required super.explicit,
    required super.type,
    required super.medium,
    required super.dead,
    required super.episodeCount,
    required super.crawlErrors,
    required super.parseErrors,
    required super.locked,
    required super.imageUrlHash,
    super.itunesId,
    super.itunesType,
    super.generator,
    super.chash,
    super.categories,
    super.value,
    super.funding,
    super.newestItemPubdate,
  });

  factory PodcastModel.fromJson(Map<String, dynamic> json) =>
      _$PodcastModelFromJson(json);

  factory PodcastModel.fromEntity(PodcastEntity entity) {
    return PodcastModel(
      id: entity.id,
      podcastGuid: entity.podcastGuid,
      title: entity.title,
      url: entity.url,
      originalUrl: entity.originalUrl,
      link: entity.link,
      description: entity.description,
      author: entity.author,
      ownerName: entity.ownerName,
      image: entity.image,
      artwork: entity.artwork,
      lastUpdateTime: entity.lastUpdateTime,
      lastCrawlTime: entity.lastCrawlTime,
      lastParseTime: entity.lastParseTime,
      lastGoodHttpStatusTime: entity.lastGoodHttpStatusTime,
      lastHttpStatus: entity.lastHttpStatus,
      contentType: entity.contentType,
      language: entity.language,
      explicit: entity.explicit,
      type: entity.type,
      medium: entity.medium,
      dead: entity.dead,
      episodeCount: entity.episodeCount,
      crawlErrors: entity.crawlErrors,
      parseErrors: entity.parseErrors,
      locked: entity.locked,
      imageUrlHash: entity.imageUrlHash,
      itunesId: entity.itunesId,
      itunesType: entity.itunesType,
      generator: entity.generator,
      chash: entity.chash,
      categories: entity.categories,
      value: entity.value,
      funding: entity.funding,
      newestItemPubdate: entity.newestItemPubdate,
    );
  }

  Map<String, dynamic> toJson() => _$PodcastModelToJson(this);
}
