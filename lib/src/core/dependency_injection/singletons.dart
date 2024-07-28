import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zaracast/src/core/network/network_info.dart';
import 'package:zaracast/src/core/secrets/podcast_index.dart';
import 'package:zaracast/src/core/utils/dio/dio_network.dart';
import 'package:zaracast/src/core/utils/drift/app_database.dart';
import 'package:zaracast/src/core/utils/podcast_index_api.dart';
import 'package:zaracast/src/features/search/data/dependency_injection/search_singletons.dart';
import 'package:zaracast/src/features/settings/data/dependency_injection/settings_singletons.dart';

final getIt = GetIt.instance;

Future<void> registerSingletons() async {
  // Initialize instances
  //final PackageInfo packageInfo = await PackageInfo.fromPlatform();
  final sharedPreferences = await SharedPreferences.getInstance();

  // Register core singletons
  getIt
    ..registerLazySingleton(AppDatabase.new)
    ..registerLazySingleton(
      () => DioNetwork(baseUrl: 'https://api.podcastindex.org/api/1.0/'),
    )
    ..registerLazySingleton(() => NetworkInfoImpl(InternetConnection()))
    ..registerLazySingleton(
      () => const PodcastIndex(
        apiKey: podcastIndexApiKey,
        apiSecret: podcastIndexApiSecret,
        userAgent: 'ZaraCast/1.0.0',
      ),
    )
    ..registerLazySingleton(() => sharedPreferences);

  // Register feature singletons
  await registerSearchSingletons();
  await registerSettingsSingletons();
}

AppDatabase get appDatabase => getIt.get<AppDatabase>();
DioNetwork get dio => getIt.get<DioNetwork>();
NetworkInfoImpl get networkInfo => getIt.get<NetworkInfoImpl>();
PodcastIndex get podcastIndex => getIt.get<PodcastIndex>();
SharedPreferences get prefs => getIt.get<SharedPreferences>();
