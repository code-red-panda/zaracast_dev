import 'package:flutter/foundation.dart';

@immutable
class PodcastEntity {
  const PodcastEntity({
    required this.id,
    required this.podcastGuid,
    required this.title,
    required this.url,
    required this.originalUrl,
    required this.link,
    required this.description,
    required this.author,
    required this.ownerName,
    required this.image,
    required this.artwork,
    required this.lastUpdateTime,
    required this.lastCrawlTime,
    required this.lastParseTime,
    required this.lastGoodHttpStatusTime,
    required this.lastHttpStatus,
    required this.contentType,
    required this.language,
    required this.explicit,
    required this.type,
    required this.medium,
    required this.dead,
    required this.episodeCount,
    required this.crawlErrors,
    required this.parseErrors,
    required this.locked,
    required this.imageUrlHash,
    this.itunesId,
    this.itunesType,
    this.generator,
    this.chash,
    this.categories,
    this.value,
    this.funding,
    this.newestItemPubdate,
  });

  const PodcastEntity.empty({
    this.id = 0,
    this.podcastGuid = '',
    this.title = '',
    this.url = '',
    this.originalUrl = '',
    this.link = '',
    this.description = '',
    this.author = '',
    this.ownerName = '',
    this.image = '',
    this.artwork = '',
    this.lastUpdateTime = 0,
    this.lastCrawlTime = 0,
    this.lastParseTime = 0,
    this.lastGoodHttpStatusTime = 0,
    this.lastHttpStatus = 0,
    this.contentType = '',
    this.language = '',
    this.explicit = false,
    this.type = 0,
    this.medium = '',
    this.dead = 0,
    this.episodeCount = 0,
    this.crawlErrors = 0,
    this.parseErrors = 0,
    this.locked = 0,
    this.imageUrlHash = 0,
    this.itunesId,
    this.itunesType,
    this.generator,
    this.chash,
    this.categories,
    this.value,
    this.funding,
    this.newestItemPubdate,
  });

  final int id;
  final String podcastGuid;
  final String title;
  final String url;
  final String originalUrl;
  final String link;
  final String description;
  final String author;
  final String ownerName;
  final String image;
  final String artwork;
  final int lastUpdateTime;
  final int lastCrawlTime;
  final int lastParseTime;
  final int lastGoodHttpStatusTime;
  final int lastHttpStatus;
  final String contentType;
  final int? itunesId;
  final String? itunesType; // GET /podcasts/byfeedid
  final String? generator; // Found nulls in the API response
  final String language;
  final bool explicit;
  final int type;
  final String medium;
  final int dead;
  final String? chash; // GET /podcasts/byfeedid
  final int episodeCount;
  final int crawlErrors;
  final int parseErrors;
  final Map<String, dynamic>? categories;
  final int locked;
  final int imageUrlHash;
  final Map<String, dynamic>? value; // GET /podcasts/byfeedid
  final Map<String, dynamic>? funding; // GET /podcasts/byfeedid
  final int? newestItemPubdate; // GET /search/byterm

  String get imageName => '$id.jpg';
/*
  PodcastEntity copyWith({
    int? id,
    String? podcastGuid,
    String? title,
    String? url,
    String? originalUrl,
    String? link,
    String? description,
    String? author,
    String? ownerName,
    String? image,
    String? artwork,
    int? lastUpdateTime,
    int? lastCrawlTime,
    int? lastParseTime,
    int? lastGoodHttpStatusTime,
    int? lastHttpStatus,
    String? contentType,
    int? itunesId,
    String? itunesType,
    String? generator,
    String? language,
    bool? explicit,
    int? type,
    String? medium,
    int? dead,
    String? chash,
    int? episodeCount,
    int? crawlErrors,
    int? parseErrors,
    Map<String, dynamic>? categories,
    int? locked,
    int? imageUrlHash,
    Map<String, dynamic>? value,
    Map<String, dynamic>? funding,
    int? newestItemPubdate,
  }) {
    return PodcastEntity(
      id: id ?? this.id,
      podcastGuid: podcastGuid ?? this.podcastGuid,
      title: title ?? this.title,
      url: url ?? this.url,
      originalUrl: url ?? this.url,
      link: link ?? this.link,
      description: description ?? this.description,
      author: author ?? this.author,
      ownerName: ownerName ?? this.ownerName,
      image: image ?? this.image,
      artwork: artwork ?? this.artwork,
      lastUpdateTime: lastUpdateTime ?? this.lastUpdateTime,
      lastCrawlTime: lastCrawlTime ?? this.lastCrawlTime,
      lastParseTime: lastParseTime ?? this.lastParseTime,
      lastGoodHttpStatusTime:
          lastGoodHttpStatusTime ?? this.lastGoodHttpStatusTime,
      lastHttpStatus: lastHttpStatus ?? this.lastHttpStatus,
      contentType: contentType ?? this.contentType,
      itunesId: itunesId ?? this.itunesId,
      itunesType: itunesType ?? this.itunesType,
      generator: generator ?? this.generator,
      language: language ?? this.language,
      explicit: explicit ?? this.explicit,
      type: type ?? this.type,
      medium: medium ?? this.medium,
      dead: dead ?? this.dead,
      chash: chash ?? this.chash,
      episodeCount: episodeCount ?? this.episodeCount,
      crawlErrors: crawlErrors ?? this.crawlErrors,
      parseErrors: parseErrors ?? this.parseErrors,
      categories: categories ?? this.categories,
      locked: locked ?? this.locked,
      imageUrlHash: imageUrlHash ?? this.imageUrlHash,
      value: value ?? this.value,
      funding: funding ?? this.funding,
      newestItemPubdate: newestItemPubdate ?? this.newestItemPubdate,
    );
  }
  */
}
