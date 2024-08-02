// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'podcast_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PodcastModel _$PodcastModelFromJson(Map<String, dynamic> json) => PodcastModel(
      id: (json['id'] as num).toInt(),
      podcastGuid: json['podcastGuid'] as String,
      title: json['title'] as String,
      url: json['url'] as String,
      originalUrl: json['originalUrl'] as String,
      link: json['link'] as String,
      description: json['description'] as String,
      author: json['author'] as String,
      ownerName: json['ownerName'] as String,
      image: json['image'] as String,
      artwork: json['artwork'] as String,
      lastUpdateTime: (json['lastUpdateTime'] as num).toInt(),
      lastCrawlTime: (json['lastCrawlTime'] as num).toInt(),
      lastParseTime: (json['lastParseTime'] as num).toInt(),
      lastGoodHttpStatusTime: (json['lastGoodHttpStatusTime'] as num).toInt(),
      lastHttpStatus: (json['lastHttpStatus'] as num).toInt(),
      contentType: json['contentType'] as String,
      language: json['language'] as String,
      explicit: json['explicit'] as bool,
      type: (json['type'] as num).toInt(),
      medium: json['medium'] as String,
      dead: (json['dead'] as num).toInt(),
      episodeCount: (json['episodeCount'] as num).toInt(),
      crawlErrors: (json['crawlErrors'] as num).toInt(),
      parseErrors: (json['parseErrors'] as num).toInt(),
      locked: (json['locked'] as num).toInt(),
      imageUrlHash: (json['imageUrlHash'] as num).toInt(),
      updatedAt: (json['updatedAt'] as num?)?.toInt() ?? 0,
      itunesId: (json['itunesId'] as num?)?.toInt(),
      itunesType: json['itunesType'] as String?,
      generator: json['generator'] as String?,
      chash: json['chash'] as String?,
      categories: json['categories'] as Map<String, dynamic>?,
      value: json['value'] as Map<String, dynamic>?,
      funding: json['funding'] as Map<String, dynamic>?,
      newestItemPubdate: (json['newestItemPubdate'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PodcastModelToJson(PodcastModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'podcastGuid': instance.podcastGuid,
      'title': instance.title,
      'url': instance.url,
      'originalUrl': instance.originalUrl,
      'link': instance.link,
      'description': instance.description,
      'author': instance.author,
      'ownerName': instance.ownerName,
      'image': instance.image,
      'artwork': instance.artwork,
      'lastUpdateTime': instance.lastUpdateTime,
      'lastCrawlTime': instance.lastCrawlTime,
      'lastParseTime': instance.lastParseTime,
      'lastGoodHttpStatusTime': instance.lastGoodHttpStatusTime,
      'lastHttpStatus': instance.lastHttpStatus,
      'contentType': instance.contentType,
      'itunesId': instance.itunesId,
      'itunesType': instance.itunesType,
      'generator': instance.generator,
      'language': instance.language,
      'explicit': instance.explicit,
      'type': instance.type,
      'medium': instance.medium,
      'dead': instance.dead,
      'chash': instance.chash,
      'episodeCount': instance.episodeCount,
      'crawlErrors': instance.crawlErrors,
      'parseErrors': instance.parseErrors,
      'categories': instance.categories,
      'locked': instance.locked,
      'imageUrlHash': instance.imageUrlHash,
      'value': instance.value,
      'funding': instance.funding,
      'newestItemPubdate': instance.newestItemPubdate,
      'updatedAt': instance.updatedAt,
    };
