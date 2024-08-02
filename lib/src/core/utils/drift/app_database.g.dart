// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $PodcastsTable extends Podcasts with TableInfo<$PodcastsTable, Podcast> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PodcastsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _podcastGuidMeta =
      const VerificationMeta('podcastGuid');
  @override
  late final GeneratedColumn<String> podcastGuid = GeneratedColumn<String>(
      'podcast_guid', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _urlMeta = const VerificationMeta('url');
  @override
  late final GeneratedColumn<String> url = GeneratedColumn<String>(
      'url', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _originalUrlMeta =
      const VerificationMeta('originalUrl');
  @override
  late final GeneratedColumn<String> originalUrl = GeneratedColumn<String>(
      'original_url', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _linkMeta = const VerificationMeta('link');
  @override
  late final GeneratedColumn<String> link = GeneratedColumn<String>(
      'link', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _authorMeta = const VerificationMeta('author');
  @override
  late final GeneratedColumn<String> author = GeneratedColumn<String>(
      'author', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _ownerNameMeta =
      const VerificationMeta('ownerName');
  @override
  late final GeneratedColumn<String> ownerName = GeneratedColumn<String>(
      'owner_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<String> image = GeneratedColumn<String>(
      'image', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _artworkMeta =
      const VerificationMeta('artwork');
  @override
  late final GeneratedColumn<String> artwork = GeneratedColumn<String>(
      'artwork', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _lastUpdateTimeMeta =
      const VerificationMeta('lastUpdateTime');
  @override
  late final GeneratedColumn<int> lastUpdateTime = GeneratedColumn<int>(
      'last_update_time', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _lastCrawlTimeMeta =
      const VerificationMeta('lastCrawlTime');
  @override
  late final GeneratedColumn<int> lastCrawlTime = GeneratedColumn<int>(
      'last_crawl_time', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _lastParseTimeMeta =
      const VerificationMeta('lastParseTime');
  @override
  late final GeneratedColumn<int> lastParseTime = GeneratedColumn<int>(
      'last_parse_time', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _lastGoodHttpStatusTimeMeta =
      const VerificationMeta('lastGoodHttpStatusTime');
  @override
  late final GeneratedColumn<int> lastGoodHttpStatusTime = GeneratedColumn<int>(
      'last_good_http_status_time', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _lastHttpStatusMeta =
      const VerificationMeta('lastHttpStatus');
  @override
  late final GeneratedColumn<int> lastHttpStatus = GeneratedColumn<int>(
      'last_http_status', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _contentTypeMeta =
      const VerificationMeta('contentType');
  @override
  late final GeneratedColumn<String> contentType = GeneratedColumn<String>(
      'content_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _itunesIdMeta =
      const VerificationMeta('itunesId');
  @override
  late final GeneratedColumn<int> itunesId = GeneratedColumn<int>(
      'itunes_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _itunesTypeMeta =
      const VerificationMeta('itunesType');
  @override
  late final GeneratedColumn<String> itunesType = GeneratedColumn<String>(
      'itunes_type', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _generatorMeta =
      const VerificationMeta('generator');
  @override
  late final GeneratedColumn<String> generator = GeneratedColumn<String>(
      'generator', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _languageMeta =
      const VerificationMeta('language');
  @override
  late final GeneratedColumn<String> language = GeneratedColumn<String>(
      'language', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _explicitMeta =
      const VerificationMeta('explicit');
  @override
  late final GeneratedColumn<bool> explicit = GeneratedColumn<bool>(
      'explicit', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("explicit" IN (0, 1))'));
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<int> type = GeneratedColumn<int>(
      'type', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _mediumMeta = const VerificationMeta('medium');
  @override
  late final GeneratedColumn<String> medium = GeneratedColumn<String>(
      'medium', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _deadMeta = const VerificationMeta('dead');
  @override
  late final GeneratedColumn<int> dead = GeneratedColumn<int>(
      'dead', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _chashMeta = const VerificationMeta('chash');
  @override
  late final GeneratedColumn<String> chash = GeneratedColumn<String>(
      'chash', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _episodeCountMeta =
      const VerificationMeta('episodeCount');
  @override
  late final GeneratedColumn<int> episodeCount = GeneratedColumn<int>(
      'episode_count', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _crawlErrorsMeta =
      const VerificationMeta('crawlErrors');
  @override
  late final GeneratedColumn<int> crawlErrors = GeneratedColumn<int>(
      'crawl_errors', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _parseErrorsMeta =
      const VerificationMeta('parseErrors');
  @override
  late final GeneratedColumn<int> parseErrors = GeneratedColumn<int>(
      'parse_errors', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _categoriesMeta =
      const VerificationMeta('categories');
  @override
  late final GeneratedColumnWithTypeConverter<Map<String, dynamic>?, String>
      categories = GeneratedColumn<String>('categories', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<Map<String, dynamic>?>(
              $PodcastsTable.$convertercategoriesn);
  static const VerificationMeta _lockedMeta = const VerificationMeta('locked');
  @override
  late final GeneratedColumn<int> locked = GeneratedColumn<int>(
      'locked', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _imageUrlHashMeta =
      const VerificationMeta('imageUrlHash');
  @override
  late final GeneratedColumn<int> imageUrlHash = GeneratedColumn<int>(
      'image_url_hash', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumnWithTypeConverter<Map<String, dynamic>?, String>
      value = GeneratedColumn<String>('value', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<Map<String, dynamic>?>(
              $PodcastsTable.$convertervaluen);
  static const VerificationMeta _fundingMeta =
      const VerificationMeta('funding');
  @override
  late final GeneratedColumnWithTypeConverter<Map<String, dynamic>?, String>
      funding = GeneratedColumn<String>('funding', aliasedName, true,
              type: DriftSqlType.string, requiredDuringInsert: false)
          .withConverter<Map<String, dynamic>?>(
              $PodcastsTable.$converterfundingn);
  static const VerificationMeta _newestItemPubdateMeta =
      const VerificationMeta('newestItemPubdate');
  @override
  late final GeneratedColumn<int> newestItemPubdate = GeneratedColumn<int>(
      'newest_item_pubdate', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        podcastGuid,
        title,
        url,
        originalUrl,
        link,
        description,
        author,
        ownerName,
        image,
        artwork,
        lastUpdateTime,
        lastCrawlTime,
        lastParseTime,
        lastGoodHttpStatusTime,
        lastHttpStatus,
        contentType,
        itunesId,
        itunesType,
        generator,
        language,
        explicit,
        type,
        medium,
        dead,
        chash,
        episodeCount,
        crawlErrors,
        parseErrors,
        categories,
        locked,
        imageUrlHash,
        value,
        funding,
        newestItemPubdate,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'podcasts';
  @override
  VerificationContext validateIntegrity(Insertable<Podcast> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('podcast_guid')) {
      context.handle(
          _podcastGuidMeta,
          podcastGuid.isAcceptableOrUnknown(
              data['podcast_guid']!, _podcastGuidMeta));
    } else if (isInserting) {
      context.missing(_podcastGuidMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('url')) {
      context.handle(
          _urlMeta, url.isAcceptableOrUnknown(data['url']!, _urlMeta));
    } else if (isInserting) {
      context.missing(_urlMeta);
    }
    if (data.containsKey('original_url')) {
      context.handle(
          _originalUrlMeta,
          originalUrl.isAcceptableOrUnknown(
              data['original_url']!, _originalUrlMeta));
    } else if (isInserting) {
      context.missing(_originalUrlMeta);
    }
    if (data.containsKey('link')) {
      context.handle(
          _linkMeta, link.isAcceptableOrUnknown(data['link']!, _linkMeta));
    } else if (isInserting) {
      context.missing(_linkMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('author')) {
      context.handle(_authorMeta,
          author.isAcceptableOrUnknown(data['author']!, _authorMeta));
    } else if (isInserting) {
      context.missing(_authorMeta);
    }
    if (data.containsKey('owner_name')) {
      context.handle(_ownerNameMeta,
          ownerName.isAcceptableOrUnknown(data['owner_name']!, _ownerNameMeta));
    } else if (isInserting) {
      context.missing(_ownerNameMeta);
    }
    if (data.containsKey('image')) {
      context.handle(
          _imageMeta, image.isAcceptableOrUnknown(data['image']!, _imageMeta));
    } else if (isInserting) {
      context.missing(_imageMeta);
    }
    if (data.containsKey('artwork')) {
      context.handle(_artworkMeta,
          artwork.isAcceptableOrUnknown(data['artwork']!, _artworkMeta));
    } else if (isInserting) {
      context.missing(_artworkMeta);
    }
    if (data.containsKey('last_update_time')) {
      context.handle(
          _lastUpdateTimeMeta,
          lastUpdateTime.isAcceptableOrUnknown(
              data['last_update_time']!, _lastUpdateTimeMeta));
    } else if (isInserting) {
      context.missing(_lastUpdateTimeMeta);
    }
    if (data.containsKey('last_crawl_time')) {
      context.handle(
          _lastCrawlTimeMeta,
          lastCrawlTime.isAcceptableOrUnknown(
              data['last_crawl_time']!, _lastCrawlTimeMeta));
    } else if (isInserting) {
      context.missing(_lastCrawlTimeMeta);
    }
    if (data.containsKey('last_parse_time')) {
      context.handle(
          _lastParseTimeMeta,
          lastParseTime.isAcceptableOrUnknown(
              data['last_parse_time']!, _lastParseTimeMeta));
    } else if (isInserting) {
      context.missing(_lastParseTimeMeta);
    }
    if (data.containsKey('last_good_http_status_time')) {
      context.handle(
          _lastGoodHttpStatusTimeMeta,
          lastGoodHttpStatusTime.isAcceptableOrUnknown(
              data['last_good_http_status_time']!,
              _lastGoodHttpStatusTimeMeta));
    } else if (isInserting) {
      context.missing(_lastGoodHttpStatusTimeMeta);
    }
    if (data.containsKey('last_http_status')) {
      context.handle(
          _lastHttpStatusMeta,
          lastHttpStatus.isAcceptableOrUnknown(
              data['last_http_status']!, _lastHttpStatusMeta));
    } else if (isInserting) {
      context.missing(_lastHttpStatusMeta);
    }
    if (data.containsKey('content_type')) {
      context.handle(
          _contentTypeMeta,
          contentType.isAcceptableOrUnknown(
              data['content_type']!, _contentTypeMeta));
    } else if (isInserting) {
      context.missing(_contentTypeMeta);
    }
    if (data.containsKey('itunes_id')) {
      context.handle(_itunesIdMeta,
          itunesId.isAcceptableOrUnknown(data['itunes_id']!, _itunesIdMeta));
    }
    if (data.containsKey('itunes_type')) {
      context.handle(
          _itunesTypeMeta,
          itunesType.isAcceptableOrUnknown(
              data['itunes_type']!, _itunesTypeMeta));
    }
    if (data.containsKey('generator')) {
      context.handle(_generatorMeta,
          generator.isAcceptableOrUnknown(data['generator']!, _generatorMeta));
    }
    if (data.containsKey('language')) {
      context.handle(_languageMeta,
          language.isAcceptableOrUnknown(data['language']!, _languageMeta));
    } else if (isInserting) {
      context.missing(_languageMeta);
    }
    if (data.containsKey('explicit')) {
      context.handle(_explicitMeta,
          explicit.isAcceptableOrUnknown(data['explicit']!, _explicitMeta));
    } else if (isInserting) {
      context.missing(_explicitMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('medium')) {
      context.handle(_mediumMeta,
          medium.isAcceptableOrUnknown(data['medium']!, _mediumMeta));
    } else if (isInserting) {
      context.missing(_mediumMeta);
    }
    if (data.containsKey('dead')) {
      context.handle(
          _deadMeta, dead.isAcceptableOrUnknown(data['dead']!, _deadMeta));
    } else if (isInserting) {
      context.missing(_deadMeta);
    }
    if (data.containsKey('chash')) {
      context.handle(
          _chashMeta, chash.isAcceptableOrUnknown(data['chash']!, _chashMeta));
    }
    if (data.containsKey('episode_count')) {
      context.handle(
          _episodeCountMeta,
          episodeCount.isAcceptableOrUnknown(
              data['episode_count']!, _episodeCountMeta));
    } else if (isInserting) {
      context.missing(_episodeCountMeta);
    }
    if (data.containsKey('crawl_errors')) {
      context.handle(
          _crawlErrorsMeta,
          crawlErrors.isAcceptableOrUnknown(
              data['crawl_errors']!, _crawlErrorsMeta));
    } else if (isInserting) {
      context.missing(_crawlErrorsMeta);
    }
    if (data.containsKey('parse_errors')) {
      context.handle(
          _parseErrorsMeta,
          parseErrors.isAcceptableOrUnknown(
              data['parse_errors']!, _parseErrorsMeta));
    } else if (isInserting) {
      context.missing(_parseErrorsMeta);
    }
    context.handle(_categoriesMeta, const VerificationResult.success());
    if (data.containsKey('locked')) {
      context.handle(_lockedMeta,
          locked.isAcceptableOrUnknown(data['locked']!, _lockedMeta));
    } else if (isInserting) {
      context.missing(_lockedMeta);
    }
    if (data.containsKey('image_url_hash')) {
      context.handle(
          _imageUrlHashMeta,
          imageUrlHash.isAcceptableOrUnknown(
              data['image_url_hash']!, _imageUrlHashMeta));
    } else if (isInserting) {
      context.missing(_imageUrlHashMeta);
    }
    context.handle(_valueMeta, const VerificationResult.success());
    context.handle(_fundingMeta, const VerificationResult.success());
    if (data.containsKey('newest_item_pubdate')) {
      context.handle(
          _newestItemPubdateMeta,
          newestItemPubdate.isAcceptableOrUnknown(
              data['newest_item_pubdate']!, _newestItemPubdateMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Podcast map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Podcast(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      podcastGuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}podcast_guid'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      url: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}url'])!,
      originalUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}original_url'])!,
      link: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}link'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      author: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}author'])!,
      ownerName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}owner_name'])!,
      image: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image'])!,
      artwork: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}artwork'])!,
      lastUpdateTime: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}last_update_time'])!,
      lastCrawlTime: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}last_crawl_time'])!,
      lastParseTime: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}last_parse_time'])!,
      lastGoodHttpStatusTime: attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}last_good_http_status_time'])!,
      lastHttpStatus: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}last_http_status'])!,
      contentType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}content_type'])!,
      itunesId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}itunes_id']),
      itunesType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}itunes_type']),
      generator: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}generator']),
      language: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}language'])!,
      explicit: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}explicit'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}type'])!,
      medium: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}medium'])!,
      dead: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}dead'])!,
      chash: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}chash']),
      episodeCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}episode_count'])!,
      crawlErrors: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}crawl_errors'])!,
      parseErrors: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}parse_errors'])!,
      categories: $PodcastsTable.$convertercategoriesn.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}categories'])),
      locked: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}locked'])!,
      imageUrlHash: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}image_url_hash'])!,
      value: $PodcastsTable.$convertervaluen.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}value'])),
      funding: $PodcastsTable.$converterfundingn.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}funding'])),
      newestItemPubdate: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}newest_item_pubdate']),
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at']),
    );
  }

  @override
  $PodcastsTable createAlias(String alias) {
    return $PodcastsTable(attachedDatabase, alias);
  }

  static TypeConverter<Map<String, dynamic>, String> $convertercategories =
      const JsonConverter();
  static TypeConverter<Map<String, dynamic>?, String?> $convertercategoriesn =
      NullAwareTypeConverter.wrap($convertercategories);
  static TypeConverter<Map<String, dynamic>, String> $convertervalue =
      const JsonConverter();
  static TypeConverter<Map<String, dynamic>?, String?> $convertervaluen =
      NullAwareTypeConverter.wrap($convertervalue);
  static TypeConverter<Map<String, dynamic>, String> $converterfunding =
      const JsonConverter();
  static TypeConverter<Map<String, dynamic>?, String?> $converterfundingn =
      NullAwareTypeConverter.wrap($converterfunding);
}

class Podcast extends DataClass implements Insertable<Podcast> {
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
  final String? itunesType;
  final String? generator;
  final String language;
  final bool explicit;
  final int type;
  final String medium;
  final int dead;
  final String? chash;
  final int episodeCount;
  final int crawlErrors;
  final int parseErrors;
  final Map<String, dynamic>? categories;
  final int locked;
  final int imageUrlHash;
  final Map<String, dynamic>? value;
  final Map<String, dynamic>? funding;
  final int? newestItemPubdate;
  final DateTime? updatedAt;
  const Podcast(
      {required this.id,
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
      this.itunesId,
      this.itunesType,
      this.generator,
      required this.language,
      required this.explicit,
      required this.type,
      required this.medium,
      required this.dead,
      this.chash,
      required this.episodeCount,
      required this.crawlErrors,
      required this.parseErrors,
      this.categories,
      required this.locked,
      required this.imageUrlHash,
      this.value,
      this.funding,
      this.newestItemPubdate,
      this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['podcast_guid'] = Variable<String>(podcastGuid);
    map['title'] = Variable<String>(title);
    map['url'] = Variable<String>(url);
    map['original_url'] = Variable<String>(originalUrl);
    map['link'] = Variable<String>(link);
    map['description'] = Variable<String>(description);
    map['author'] = Variable<String>(author);
    map['owner_name'] = Variable<String>(ownerName);
    map['image'] = Variable<String>(image);
    map['artwork'] = Variable<String>(artwork);
    map['last_update_time'] = Variable<int>(lastUpdateTime);
    map['last_crawl_time'] = Variable<int>(lastCrawlTime);
    map['last_parse_time'] = Variable<int>(lastParseTime);
    map['last_good_http_status_time'] = Variable<int>(lastGoodHttpStatusTime);
    map['last_http_status'] = Variable<int>(lastHttpStatus);
    map['content_type'] = Variable<String>(contentType);
    if (!nullToAbsent || itunesId != null) {
      map['itunes_id'] = Variable<int>(itunesId);
    }
    if (!nullToAbsent || itunesType != null) {
      map['itunes_type'] = Variable<String>(itunesType);
    }
    if (!nullToAbsent || generator != null) {
      map['generator'] = Variable<String>(generator);
    }
    map['language'] = Variable<String>(language);
    map['explicit'] = Variable<bool>(explicit);
    map['type'] = Variable<int>(type);
    map['medium'] = Variable<String>(medium);
    map['dead'] = Variable<int>(dead);
    if (!nullToAbsent || chash != null) {
      map['chash'] = Variable<String>(chash);
    }
    map['episode_count'] = Variable<int>(episodeCount);
    map['crawl_errors'] = Variable<int>(crawlErrors);
    map['parse_errors'] = Variable<int>(parseErrors);
    if (!nullToAbsent || categories != null) {
      map['categories'] = Variable<String>(
          $PodcastsTable.$convertercategoriesn.toSql(categories));
    }
    map['locked'] = Variable<int>(locked);
    map['image_url_hash'] = Variable<int>(imageUrlHash);
    if (!nullToAbsent || value != null) {
      map['value'] =
          Variable<String>($PodcastsTable.$convertervaluen.toSql(value));
    }
    if (!nullToAbsent || funding != null) {
      map['funding'] =
          Variable<String>($PodcastsTable.$converterfundingn.toSql(funding));
    }
    if (!nullToAbsent || newestItemPubdate != null) {
      map['newest_item_pubdate'] = Variable<int>(newestItemPubdate);
    }
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    return map;
  }

  PodcastsCompanion toCompanion(bool nullToAbsent) {
    return PodcastsCompanion(
      id: Value(id),
      podcastGuid: Value(podcastGuid),
      title: Value(title),
      url: Value(url),
      originalUrl: Value(originalUrl),
      link: Value(link),
      description: Value(description),
      author: Value(author),
      ownerName: Value(ownerName),
      image: Value(image),
      artwork: Value(artwork),
      lastUpdateTime: Value(lastUpdateTime),
      lastCrawlTime: Value(lastCrawlTime),
      lastParseTime: Value(lastParseTime),
      lastGoodHttpStatusTime: Value(lastGoodHttpStatusTime),
      lastHttpStatus: Value(lastHttpStatus),
      contentType: Value(contentType),
      itunesId: itunesId == null && nullToAbsent
          ? const Value.absent()
          : Value(itunesId),
      itunesType: itunesType == null && nullToAbsent
          ? const Value.absent()
          : Value(itunesType),
      generator: generator == null && nullToAbsent
          ? const Value.absent()
          : Value(generator),
      language: Value(language),
      explicit: Value(explicit),
      type: Value(type),
      medium: Value(medium),
      dead: Value(dead),
      chash:
          chash == null && nullToAbsent ? const Value.absent() : Value(chash),
      episodeCount: Value(episodeCount),
      crawlErrors: Value(crawlErrors),
      parseErrors: Value(parseErrors),
      categories: categories == null && nullToAbsent
          ? const Value.absent()
          : Value(categories),
      locked: Value(locked),
      imageUrlHash: Value(imageUrlHash),
      value:
          value == null && nullToAbsent ? const Value.absent() : Value(value),
      funding: funding == null && nullToAbsent
          ? const Value.absent()
          : Value(funding),
      newestItemPubdate: newestItemPubdate == null && nullToAbsent
          ? const Value.absent()
          : Value(newestItemPubdate),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
    );
  }

  factory Podcast.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Podcast(
      id: serializer.fromJson<int>(json['id']),
      podcastGuid: serializer.fromJson<String>(json['podcastGuid']),
      title: serializer.fromJson<String>(json['title']),
      url: serializer.fromJson<String>(json['url']),
      originalUrl: serializer.fromJson<String>(json['originalUrl']),
      link: serializer.fromJson<String>(json['link']),
      description: serializer.fromJson<String>(json['description']),
      author: serializer.fromJson<String>(json['author']),
      ownerName: serializer.fromJson<String>(json['ownerName']),
      image: serializer.fromJson<String>(json['image']),
      artwork: serializer.fromJson<String>(json['artwork']),
      lastUpdateTime: serializer.fromJson<int>(json['lastUpdateTime']),
      lastCrawlTime: serializer.fromJson<int>(json['lastCrawlTime']),
      lastParseTime: serializer.fromJson<int>(json['lastParseTime']),
      lastGoodHttpStatusTime:
          serializer.fromJson<int>(json['lastGoodHttpStatusTime']),
      lastHttpStatus: serializer.fromJson<int>(json['lastHttpStatus']),
      contentType: serializer.fromJson<String>(json['contentType']),
      itunesId: serializer.fromJson<int?>(json['itunesId']),
      itunesType: serializer.fromJson<String?>(json['itunesType']),
      generator: serializer.fromJson<String?>(json['generator']),
      language: serializer.fromJson<String>(json['language']),
      explicit: serializer.fromJson<bool>(json['explicit']),
      type: serializer.fromJson<int>(json['type']),
      medium: serializer.fromJson<String>(json['medium']),
      dead: serializer.fromJson<int>(json['dead']),
      chash: serializer.fromJson<String?>(json['chash']),
      episodeCount: serializer.fromJson<int>(json['episodeCount']),
      crawlErrors: serializer.fromJson<int>(json['crawlErrors']),
      parseErrors: serializer.fromJson<int>(json['parseErrors']),
      categories:
          serializer.fromJson<Map<String, dynamic>?>(json['categories']),
      locked: serializer.fromJson<int>(json['locked']),
      imageUrlHash: serializer.fromJson<int>(json['imageUrlHash']),
      value: serializer.fromJson<Map<String, dynamic>?>(json['value']),
      funding: serializer.fromJson<Map<String, dynamic>?>(json['funding']),
      newestItemPubdate: serializer.fromJson<int?>(json['newestItemPubdate']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'podcastGuid': serializer.toJson<String>(podcastGuid),
      'title': serializer.toJson<String>(title),
      'url': serializer.toJson<String>(url),
      'originalUrl': serializer.toJson<String>(originalUrl),
      'link': serializer.toJson<String>(link),
      'description': serializer.toJson<String>(description),
      'author': serializer.toJson<String>(author),
      'ownerName': serializer.toJson<String>(ownerName),
      'image': serializer.toJson<String>(image),
      'artwork': serializer.toJson<String>(artwork),
      'lastUpdateTime': serializer.toJson<int>(lastUpdateTime),
      'lastCrawlTime': serializer.toJson<int>(lastCrawlTime),
      'lastParseTime': serializer.toJson<int>(lastParseTime),
      'lastGoodHttpStatusTime': serializer.toJson<int>(lastGoodHttpStatusTime),
      'lastHttpStatus': serializer.toJson<int>(lastHttpStatus),
      'contentType': serializer.toJson<String>(contentType),
      'itunesId': serializer.toJson<int?>(itunesId),
      'itunesType': serializer.toJson<String?>(itunesType),
      'generator': serializer.toJson<String?>(generator),
      'language': serializer.toJson<String>(language),
      'explicit': serializer.toJson<bool>(explicit),
      'type': serializer.toJson<int>(type),
      'medium': serializer.toJson<String>(medium),
      'dead': serializer.toJson<int>(dead),
      'chash': serializer.toJson<String?>(chash),
      'episodeCount': serializer.toJson<int>(episodeCount),
      'crawlErrors': serializer.toJson<int>(crawlErrors),
      'parseErrors': serializer.toJson<int>(parseErrors),
      'categories': serializer.toJson<Map<String, dynamic>?>(categories),
      'locked': serializer.toJson<int>(locked),
      'imageUrlHash': serializer.toJson<int>(imageUrlHash),
      'value': serializer.toJson<Map<String, dynamic>?>(value),
      'funding': serializer.toJson<Map<String, dynamic>?>(funding),
      'newestItemPubdate': serializer.toJson<int?>(newestItemPubdate),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
    };
  }

  Podcast copyWith(
          {int? id,
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
          Value<int?> itunesId = const Value.absent(),
          Value<String?> itunesType = const Value.absent(),
          Value<String?> generator = const Value.absent(),
          String? language,
          bool? explicit,
          int? type,
          String? medium,
          int? dead,
          Value<String?> chash = const Value.absent(),
          int? episodeCount,
          int? crawlErrors,
          int? parseErrors,
          Value<Map<String, dynamic>?> categories = const Value.absent(),
          int? locked,
          int? imageUrlHash,
          Value<Map<String, dynamic>?> value = const Value.absent(),
          Value<Map<String, dynamic>?> funding = const Value.absent(),
          Value<int?> newestItemPubdate = const Value.absent(),
          Value<DateTime?> updatedAt = const Value.absent()}) =>
      Podcast(
        id: id ?? this.id,
        podcastGuid: podcastGuid ?? this.podcastGuid,
        title: title ?? this.title,
        url: url ?? this.url,
        originalUrl: originalUrl ?? this.originalUrl,
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
        itunesId: itunesId.present ? itunesId.value : this.itunesId,
        itunesType: itunesType.present ? itunesType.value : this.itunesType,
        generator: generator.present ? generator.value : this.generator,
        language: language ?? this.language,
        explicit: explicit ?? this.explicit,
        type: type ?? this.type,
        medium: medium ?? this.medium,
        dead: dead ?? this.dead,
        chash: chash.present ? chash.value : this.chash,
        episodeCount: episodeCount ?? this.episodeCount,
        crawlErrors: crawlErrors ?? this.crawlErrors,
        parseErrors: parseErrors ?? this.parseErrors,
        categories: categories.present ? categories.value : this.categories,
        locked: locked ?? this.locked,
        imageUrlHash: imageUrlHash ?? this.imageUrlHash,
        value: value.present ? value.value : this.value,
        funding: funding.present ? funding.value : this.funding,
        newestItemPubdate: newestItemPubdate.present
            ? newestItemPubdate.value
            : this.newestItemPubdate,
        updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
      );
  Podcast copyWithCompanion(PodcastsCompanion data) {
    return Podcast(
      id: data.id.present ? data.id.value : this.id,
      podcastGuid:
          data.podcastGuid.present ? data.podcastGuid.value : this.podcastGuid,
      title: data.title.present ? data.title.value : this.title,
      url: data.url.present ? data.url.value : this.url,
      originalUrl:
          data.originalUrl.present ? data.originalUrl.value : this.originalUrl,
      link: data.link.present ? data.link.value : this.link,
      description:
          data.description.present ? data.description.value : this.description,
      author: data.author.present ? data.author.value : this.author,
      ownerName: data.ownerName.present ? data.ownerName.value : this.ownerName,
      image: data.image.present ? data.image.value : this.image,
      artwork: data.artwork.present ? data.artwork.value : this.artwork,
      lastUpdateTime: data.lastUpdateTime.present
          ? data.lastUpdateTime.value
          : this.lastUpdateTime,
      lastCrawlTime: data.lastCrawlTime.present
          ? data.lastCrawlTime.value
          : this.lastCrawlTime,
      lastParseTime: data.lastParseTime.present
          ? data.lastParseTime.value
          : this.lastParseTime,
      lastGoodHttpStatusTime: data.lastGoodHttpStatusTime.present
          ? data.lastGoodHttpStatusTime.value
          : this.lastGoodHttpStatusTime,
      lastHttpStatus: data.lastHttpStatus.present
          ? data.lastHttpStatus.value
          : this.lastHttpStatus,
      contentType:
          data.contentType.present ? data.contentType.value : this.contentType,
      itunesId: data.itunesId.present ? data.itunesId.value : this.itunesId,
      itunesType:
          data.itunesType.present ? data.itunesType.value : this.itunesType,
      generator: data.generator.present ? data.generator.value : this.generator,
      language: data.language.present ? data.language.value : this.language,
      explicit: data.explicit.present ? data.explicit.value : this.explicit,
      type: data.type.present ? data.type.value : this.type,
      medium: data.medium.present ? data.medium.value : this.medium,
      dead: data.dead.present ? data.dead.value : this.dead,
      chash: data.chash.present ? data.chash.value : this.chash,
      episodeCount: data.episodeCount.present
          ? data.episodeCount.value
          : this.episodeCount,
      crawlErrors:
          data.crawlErrors.present ? data.crawlErrors.value : this.crawlErrors,
      parseErrors:
          data.parseErrors.present ? data.parseErrors.value : this.parseErrors,
      categories:
          data.categories.present ? data.categories.value : this.categories,
      locked: data.locked.present ? data.locked.value : this.locked,
      imageUrlHash: data.imageUrlHash.present
          ? data.imageUrlHash.value
          : this.imageUrlHash,
      value: data.value.present ? data.value.value : this.value,
      funding: data.funding.present ? data.funding.value : this.funding,
      newestItemPubdate: data.newestItemPubdate.present
          ? data.newestItemPubdate.value
          : this.newestItemPubdate,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Podcast(')
          ..write('id: $id, ')
          ..write('podcastGuid: $podcastGuid, ')
          ..write('title: $title, ')
          ..write('url: $url, ')
          ..write('originalUrl: $originalUrl, ')
          ..write('link: $link, ')
          ..write('description: $description, ')
          ..write('author: $author, ')
          ..write('ownerName: $ownerName, ')
          ..write('image: $image, ')
          ..write('artwork: $artwork, ')
          ..write('lastUpdateTime: $lastUpdateTime, ')
          ..write('lastCrawlTime: $lastCrawlTime, ')
          ..write('lastParseTime: $lastParseTime, ')
          ..write('lastGoodHttpStatusTime: $lastGoodHttpStatusTime, ')
          ..write('lastHttpStatus: $lastHttpStatus, ')
          ..write('contentType: $contentType, ')
          ..write('itunesId: $itunesId, ')
          ..write('itunesType: $itunesType, ')
          ..write('generator: $generator, ')
          ..write('language: $language, ')
          ..write('explicit: $explicit, ')
          ..write('type: $type, ')
          ..write('medium: $medium, ')
          ..write('dead: $dead, ')
          ..write('chash: $chash, ')
          ..write('episodeCount: $episodeCount, ')
          ..write('crawlErrors: $crawlErrors, ')
          ..write('parseErrors: $parseErrors, ')
          ..write('categories: $categories, ')
          ..write('locked: $locked, ')
          ..write('imageUrlHash: $imageUrlHash, ')
          ..write('value: $value, ')
          ..write('funding: $funding, ')
          ..write('newestItemPubdate: $newestItemPubdate, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
        id,
        podcastGuid,
        title,
        url,
        originalUrl,
        link,
        description,
        author,
        ownerName,
        image,
        artwork,
        lastUpdateTime,
        lastCrawlTime,
        lastParseTime,
        lastGoodHttpStatusTime,
        lastHttpStatus,
        contentType,
        itunesId,
        itunesType,
        generator,
        language,
        explicit,
        type,
        medium,
        dead,
        chash,
        episodeCount,
        crawlErrors,
        parseErrors,
        categories,
        locked,
        imageUrlHash,
        value,
        funding,
        newestItemPubdate,
        updatedAt
      ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Podcast &&
          other.id == this.id &&
          other.podcastGuid == this.podcastGuid &&
          other.title == this.title &&
          other.url == this.url &&
          other.originalUrl == this.originalUrl &&
          other.link == this.link &&
          other.description == this.description &&
          other.author == this.author &&
          other.ownerName == this.ownerName &&
          other.image == this.image &&
          other.artwork == this.artwork &&
          other.lastUpdateTime == this.lastUpdateTime &&
          other.lastCrawlTime == this.lastCrawlTime &&
          other.lastParseTime == this.lastParseTime &&
          other.lastGoodHttpStatusTime == this.lastGoodHttpStatusTime &&
          other.lastHttpStatus == this.lastHttpStatus &&
          other.contentType == this.contentType &&
          other.itunesId == this.itunesId &&
          other.itunesType == this.itunesType &&
          other.generator == this.generator &&
          other.language == this.language &&
          other.explicit == this.explicit &&
          other.type == this.type &&
          other.medium == this.medium &&
          other.dead == this.dead &&
          other.chash == this.chash &&
          other.episodeCount == this.episodeCount &&
          other.crawlErrors == this.crawlErrors &&
          other.parseErrors == this.parseErrors &&
          other.categories == this.categories &&
          other.locked == this.locked &&
          other.imageUrlHash == this.imageUrlHash &&
          other.value == this.value &&
          other.funding == this.funding &&
          other.newestItemPubdate == this.newestItemPubdate &&
          other.updatedAt == this.updatedAt);
}

class PodcastsCompanion extends UpdateCompanion<Podcast> {
  final Value<int> id;
  final Value<String> podcastGuid;
  final Value<String> title;
  final Value<String> url;
  final Value<String> originalUrl;
  final Value<String> link;
  final Value<String> description;
  final Value<String> author;
  final Value<String> ownerName;
  final Value<String> image;
  final Value<String> artwork;
  final Value<int> lastUpdateTime;
  final Value<int> lastCrawlTime;
  final Value<int> lastParseTime;
  final Value<int> lastGoodHttpStatusTime;
  final Value<int> lastHttpStatus;
  final Value<String> contentType;
  final Value<int?> itunesId;
  final Value<String?> itunesType;
  final Value<String?> generator;
  final Value<String> language;
  final Value<bool> explicit;
  final Value<int> type;
  final Value<String> medium;
  final Value<int> dead;
  final Value<String?> chash;
  final Value<int> episodeCount;
  final Value<int> crawlErrors;
  final Value<int> parseErrors;
  final Value<Map<String, dynamic>?> categories;
  final Value<int> locked;
  final Value<int> imageUrlHash;
  final Value<Map<String, dynamic>?> value;
  final Value<Map<String, dynamic>?> funding;
  final Value<int?> newestItemPubdate;
  final Value<DateTime?> updatedAt;
  const PodcastsCompanion({
    this.id = const Value.absent(),
    this.podcastGuid = const Value.absent(),
    this.title = const Value.absent(),
    this.url = const Value.absent(),
    this.originalUrl = const Value.absent(),
    this.link = const Value.absent(),
    this.description = const Value.absent(),
    this.author = const Value.absent(),
    this.ownerName = const Value.absent(),
    this.image = const Value.absent(),
    this.artwork = const Value.absent(),
    this.lastUpdateTime = const Value.absent(),
    this.lastCrawlTime = const Value.absent(),
    this.lastParseTime = const Value.absent(),
    this.lastGoodHttpStatusTime = const Value.absent(),
    this.lastHttpStatus = const Value.absent(),
    this.contentType = const Value.absent(),
    this.itunesId = const Value.absent(),
    this.itunesType = const Value.absent(),
    this.generator = const Value.absent(),
    this.language = const Value.absent(),
    this.explicit = const Value.absent(),
    this.type = const Value.absent(),
    this.medium = const Value.absent(),
    this.dead = const Value.absent(),
    this.chash = const Value.absent(),
    this.episodeCount = const Value.absent(),
    this.crawlErrors = const Value.absent(),
    this.parseErrors = const Value.absent(),
    this.categories = const Value.absent(),
    this.locked = const Value.absent(),
    this.imageUrlHash = const Value.absent(),
    this.value = const Value.absent(),
    this.funding = const Value.absent(),
    this.newestItemPubdate = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  PodcastsCompanion.insert({
    this.id = const Value.absent(),
    required String podcastGuid,
    required String title,
    required String url,
    required String originalUrl,
    required String link,
    required String description,
    required String author,
    required String ownerName,
    required String image,
    required String artwork,
    required int lastUpdateTime,
    required int lastCrawlTime,
    required int lastParseTime,
    required int lastGoodHttpStatusTime,
    required int lastHttpStatus,
    required String contentType,
    this.itunesId = const Value.absent(),
    this.itunesType = const Value.absent(),
    this.generator = const Value.absent(),
    required String language,
    required bool explicit,
    required int type,
    required String medium,
    required int dead,
    this.chash = const Value.absent(),
    required int episodeCount,
    required int crawlErrors,
    required int parseErrors,
    this.categories = const Value.absent(),
    required int locked,
    required int imageUrlHash,
    this.value = const Value.absent(),
    this.funding = const Value.absent(),
    this.newestItemPubdate = const Value.absent(),
    this.updatedAt = const Value.absent(),
  })  : podcastGuid = Value(podcastGuid),
        title = Value(title),
        url = Value(url),
        originalUrl = Value(originalUrl),
        link = Value(link),
        description = Value(description),
        author = Value(author),
        ownerName = Value(ownerName),
        image = Value(image),
        artwork = Value(artwork),
        lastUpdateTime = Value(lastUpdateTime),
        lastCrawlTime = Value(lastCrawlTime),
        lastParseTime = Value(lastParseTime),
        lastGoodHttpStatusTime = Value(lastGoodHttpStatusTime),
        lastHttpStatus = Value(lastHttpStatus),
        contentType = Value(contentType),
        language = Value(language),
        explicit = Value(explicit),
        type = Value(type),
        medium = Value(medium),
        dead = Value(dead),
        episodeCount = Value(episodeCount),
        crawlErrors = Value(crawlErrors),
        parseErrors = Value(parseErrors),
        locked = Value(locked),
        imageUrlHash = Value(imageUrlHash);
  static Insertable<Podcast> custom({
    Expression<int>? id,
    Expression<String>? podcastGuid,
    Expression<String>? title,
    Expression<String>? url,
    Expression<String>? originalUrl,
    Expression<String>? link,
    Expression<String>? description,
    Expression<String>? author,
    Expression<String>? ownerName,
    Expression<String>? image,
    Expression<String>? artwork,
    Expression<int>? lastUpdateTime,
    Expression<int>? lastCrawlTime,
    Expression<int>? lastParseTime,
    Expression<int>? lastGoodHttpStatusTime,
    Expression<int>? lastHttpStatus,
    Expression<String>? contentType,
    Expression<int>? itunesId,
    Expression<String>? itunesType,
    Expression<String>? generator,
    Expression<String>? language,
    Expression<bool>? explicit,
    Expression<int>? type,
    Expression<String>? medium,
    Expression<int>? dead,
    Expression<String>? chash,
    Expression<int>? episodeCount,
    Expression<int>? crawlErrors,
    Expression<int>? parseErrors,
    Expression<String>? categories,
    Expression<int>? locked,
    Expression<int>? imageUrlHash,
    Expression<String>? value,
    Expression<String>? funding,
    Expression<int>? newestItemPubdate,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (podcastGuid != null) 'podcast_guid': podcastGuid,
      if (title != null) 'title': title,
      if (url != null) 'url': url,
      if (originalUrl != null) 'original_url': originalUrl,
      if (link != null) 'link': link,
      if (description != null) 'description': description,
      if (author != null) 'author': author,
      if (ownerName != null) 'owner_name': ownerName,
      if (image != null) 'image': image,
      if (artwork != null) 'artwork': artwork,
      if (lastUpdateTime != null) 'last_update_time': lastUpdateTime,
      if (lastCrawlTime != null) 'last_crawl_time': lastCrawlTime,
      if (lastParseTime != null) 'last_parse_time': lastParseTime,
      if (lastGoodHttpStatusTime != null)
        'last_good_http_status_time': lastGoodHttpStatusTime,
      if (lastHttpStatus != null) 'last_http_status': lastHttpStatus,
      if (contentType != null) 'content_type': contentType,
      if (itunesId != null) 'itunes_id': itunesId,
      if (itunesType != null) 'itunes_type': itunesType,
      if (generator != null) 'generator': generator,
      if (language != null) 'language': language,
      if (explicit != null) 'explicit': explicit,
      if (type != null) 'type': type,
      if (medium != null) 'medium': medium,
      if (dead != null) 'dead': dead,
      if (chash != null) 'chash': chash,
      if (episodeCount != null) 'episode_count': episodeCount,
      if (crawlErrors != null) 'crawl_errors': crawlErrors,
      if (parseErrors != null) 'parse_errors': parseErrors,
      if (categories != null) 'categories': categories,
      if (locked != null) 'locked': locked,
      if (imageUrlHash != null) 'image_url_hash': imageUrlHash,
      if (value != null) 'value': value,
      if (funding != null) 'funding': funding,
      if (newestItemPubdate != null) 'newest_item_pubdate': newestItemPubdate,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  PodcastsCompanion copyWith(
      {Value<int>? id,
      Value<String>? podcastGuid,
      Value<String>? title,
      Value<String>? url,
      Value<String>? originalUrl,
      Value<String>? link,
      Value<String>? description,
      Value<String>? author,
      Value<String>? ownerName,
      Value<String>? image,
      Value<String>? artwork,
      Value<int>? lastUpdateTime,
      Value<int>? lastCrawlTime,
      Value<int>? lastParseTime,
      Value<int>? lastGoodHttpStatusTime,
      Value<int>? lastHttpStatus,
      Value<String>? contentType,
      Value<int?>? itunesId,
      Value<String?>? itunesType,
      Value<String?>? generator,
      Value<String>? language,
      Value<bool>? explicit,
      Value<int>? type,
      Value<String>? medium,
      Value<int>? dead,
      Value<String?>? chash,
      Value<int>? episodeCount,
      Value<int>? crawlErrors,
      Value<int>? parseErrors,
      Value<Map<String, dynamic>?>? categories,
      Value<int>? locked,
      Value<int>? imageUrlHash,
      Value<Map<String, dynamic>?>? value,
      Value<Map<String, dynamic>?>? funding,
      Value<int?>? newestItemPubdate,
      Value<DateTime?>? updatedAt}) {
    return PodcastsCompanion(
      id: id ?? this.id,
      podcastGuid: podcastGuid ?? this.podcastGuid,
      title: title ?? this.title,
      url: url ?? this.url,
      originalUrl: originalUrl ?? this.originalUrl,
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
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (podcastGuid.present) {
      map['podcast_guid'] = Variable<String>(podcastGuid.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    if (originalUrl.present) {
      map['original_url'] = Variable<String>(originalUrl.value);
    }
    if (link.present) {
      map['link'] = Variable<String>(link.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (author.present) {
      map['author'] = Variable<String>(author.value);
    }
    if (ownerName.present) {
      map['owner_name'] = Variable<String>(ownerName.value);
    }
    if (image.present) {
      map['image'] = Variable<String>(image.value);
    }
    if (artwork.present) {
      map['artwork'] = Variable<String>(artwork.value);
    }
    if (lastUpdateTime.present) {
      map['last_update_time'] = Variable<int>(lastUpdateTime.value);
    }
    if (lastCrawlTime.present) {
      map['last_crawl_time'] = Variable<int>(lastCrawlTime.value);
    }
    if (lastParseTime.present) {
      map['last_parse_time'] = Variable<int>(lastParseTime.value);
    }
    if (lastGoodHttpStatusTime.present) {
      map['last_good_http_status_time'] =
          Variable<int>(lastGoodHttpStatusTime.value);
    }
    if (lastHttpStatus.present) {
      map['last_http_status'] = Variable<int>(lastHttpStatus.value);
    }
    if (contentType.present) {
      map['content_type'] = Variable<String>(contentType.value);
    }
    if (itunesId.present) {
      map['itunes_id'] = Variable<int>(itunesId.value);
    }
    if (itunesType.present) {
      map['itunes_type'] = Variable<String>(itunesType.value);
    }
    if (generator.present) {
      map['generator'] = Variable<String>(generator.value);
    }
    if (language.present) {
      map['language'] = Variable<String>(language.value);
    }
    if (explicit.present) {
      map['explicit'] = Variable<bool>(explicit.value);
    }
    if (type.present) {
      map['type'] = Variable<int>(type.value);
    }
    if (medium.present) {
      map['medium'] = Variable<String>(medium.value);
    }
    if (dead.present) {
      map['dead'] = Variable<int>(dead.value);
    }
    if (chash.present) {
      map['chash'] = Variable<String>(chash.value);
    }
    if (episodeCount.present) {
      map['episode_count'] = Variable<int>(episodeCount.value);
    }
    if (crawlErrors.present) {
      map['crawl_errors'] = Variable<int>(crawlErrors.value);
    }
    if (parseErrors.present) {
      map['parse_errors'] = Variable<int>(parseErrors.value);
    }
    if (categories.present) {
      map['categories'] = Variable<String>(
          $PodcastsTable.$convertercategoriesn.toSql(categories.value));
    }
    if (locked.present) {
      map['locked'] = Variable<int>(locked.value);
    }
    if (imageUrlHash.present) {
      map['image_url_hash'] = Variable<int>(imageUrlHash.value);
    }
    if (value.present) {
      map['value'] =
          Variable<String>($PodcastsTable.$convertervaluen.toSql(value.value));
    }
    if (funding.present) {
      map['funding'] = Variable<String>(
          $PodcastsTable.$converterfundingn.toSql(funding.value));
    }
    if (newestItemPubdate.present) {
      map['newest_item_pubdate'] = Variable<int>(newestItemPubdate.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PodcastsCompanion(')
          ..write('id: $id, ')
          ..write('podcastGuid: $podcastGuid, ')
          ..write('title: $title, ')
          ..write('url: $url, ')
          ..write('originalUrl: $originalUrl, ')
          ..write('link: $link, ')
          ..write('description: $description, ')
          ..write('author: $author, ')
          ..write('ownerName: $ownerName, ')
          ..write('image: $image, ')
          ..write('artwork: $artwork, ')
          ..write('lastUpdateTime: $lastUpdateTime, ')
          ..write('lastCrawlTime: $lastCrawlTime, ')
          ..write('lastParseTime: $lastParseTime, ')
          ..write('lastGoodHttpStatusTime: $lastGoodHttpStatusTime, ')
          ..write('lastHttpStatus: $lastHttpStatus, ')
          ..write('contentType: $contentType, ')
          ..write('itunesId: $itunesId, ')
          ..write('itunesType: $itunesType, ')
          ..write('generator: $generator, ')
          ..write('language: $language, ')
          ..write('explicit: $explicit, ')
          ..write('type: $type, ')
          ..write('medium: $medium, ')
          ..write('dead: $dead, ')
          ..write('chash: $chash, ')
          ..write('episodeCount: $episodeCount, ')
          ..write('crawlErrors: $crawlErrors, ')
          ..write('parseErrors: $parseErrors, ')
          ..write('categories: $categories, ')
          ..write('locked: $locked, ')
          ..write('imageUrlHash: $imageUrlHash, ')
          ..write('value: $value, ')
          ..write('funding: $funding, ')
          ..write('newestItemPubdate: $newestItemPubdate, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $PodcastSearchHistoryTable extends PodcastSearchHistory
    with TableInfo<$PodcastSearchHistoryTable, PodcastSearchHistoryData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PodcastSearchHistoryTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES podcasts (id)'));
  static const VerificationMeta _searchedAtMeta =
      const VerificationMeta('searchedAt');
  @override
  late final GeneratedColumn<DateTime> searchedAt = GeneratedColumn<DateTime>(
      'searched_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, searchedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'podcast_search_history';
  @override
  VerificationContext validateIntegrity(
      Insertable<PodcastSearchHistoryData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('searched_at')) {
      context.handle(
          _searchedAtMeta,
          searchedAt.isAcceptableOrUnknown(
              data['searched_at']!, _searchedAtMeta));
    } else if (isInserting) {
      context.missing(_searchedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PodcastSearchHistoryData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PodcastSearchHistoryData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      searchedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}searched_at'])!,
    );
  }

  @override
  $PodcastSearchHistoryTable createAlias(String alias) {
    return $PodcastSearchHistoryTable(attachedDatabase, alias);
  }
}

class PodcastSearchHistoryData extends DataClass
    implements Insertable<PodcastSearchHistoryData> {
  final int id;
  final DateTime searchedAt;
  const PodcastSearchHistoryData({required this.id, required this.searchedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['searched_at'] = Variable<DateTime>(searchedAt);
    return map;
  }

  PodcastSearchHistoryCompanion toCompanion(bool nullToAbsent) {
    return PodcastSearchHistoryCompanion(
      id: Value(id),
      searchedAt: Value(searchedAt),
    );
  }

  factory PodcastSearchHistoryData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PodcastSearchHistoryData(
      id: serializer.fromJson<int>(json['id']),
      searchedAt: serializer.fromJson<DateTime>(json['searchedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'searchedAt': serializer.toJson<DateTime>(searchedAt),
    };
  }

  PodcastSearchHistoryData copyWith({int? id, DateTime? searchedAt}) =>
      PodcastSearchHistoryData(
        id: id ?? this.id,
        searchedAt: searchedAt ?? this.searchedAt,
      );
  PodcastSearchHistoryData copyWithCompanion(
      PodcastSearchHistoryCompanion data) {
    return PodcastSearchHistoryData(
      id: data.id.present ? data.id.value : this.id,
      searchedAt:
          data.searchedAt.present ? data.searchedAt.value : this.searchedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PodcastSearchHistoryData(')
          ..write('id: $id, ')
          ..write('searchedAt: $searchedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, searchedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PodcastSearchHistoryData &&
          other.id == this.id &&
          other.searchedAt == this.searchedAt);
}

class PodcastSearchHistoryCompanion
    extends UpdateCompanion<PodcastSearchHistoryData> {
  final Value<int> id;
  final Value<DateTime> searchedAt;
  const PodcastSearchHistoryCompanion({
    this.id = const Value.absent(),
    this.searchedAt = const Value.absent(),
  });
  PodcastSearchHistoryCompanion.insert({
    this.id = const Value.absent(),
    required DateTime searchedAt,
  }) : searchedAt = Value(searchedAt);
  static Insertable<PodcastSearchHistoryData> custom({
    Expression<int>? id,
    Expression<DateTime>? searchedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (searchedAt != null) 'searched_at': searchedAt,
    });
  }

  PodcastSearchHistoryCompanion copyWith(
      {Value<int>? id, Value<DateTime>? searchedAt}) {
    return PodcastSearchHistoryCompanion(
      id: id ?? this.id,
      searchedAt: searchedAt ?? this.searchedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (searchedAt.present) {
      map['searched_at'] = Variable<DateTime>(searchedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PodcastSearchHistoryCompanion(')
          ..write('id: $id, ')
          ..write('searchedAt: $searchedAt')
          ..write(')'))
        .toString();
  }
}

class $UserSettingsTable extends UserSettings
    with TableInfo<$UserSettingsTable, UserSetting> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserSettingsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
      'user_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _themeMeta = const VerificationMeta('theme');
  @override
  late final GeneratedColumn<String> theme = GeneratedColumn<String>(
      'theme', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _themeModeMeta =
      const VerificationMeta('themeMode');
  @override
  late final GeneratedColumn<String> themeMode = GeneratedColumn<String>(
      'theme_mode', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [userId, theme, themeMode];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_settings';
  @override
  VerificationContext validateIntegrity(Insertable<UserSetting> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('theme')) {
      context.handle(
          _themeMeta, theme.isAcceptableOrUnknown(data['theme']!, _themeMeta));
    } else if (isInserting) {
      context.missing(_themeMeta);
    }
    if (data.containsKey('theme_mode')) {
      context.handle(_themeModeMeta,
          themeMode.isAcceptableOrUnknown(data['theme_mode']!, _themeModeMeta));
    } else if (isInserting) {
      context.missing(_themeModeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {userId};
  @override
  UserSetting map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserSetting(
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_id'])!,
      theme: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}theme'])!,
      themeMode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}theme_mode'])!,
    );
  }

  @override
  $UserSettingsTable createAlias(String alias) {
    return $UserSettingsTable(attachedDatabase, alias);
  }
}

class UserSetting extends DataClass implements Insertable<UserSetting> {
  final String userId;
  final String theme;
  final String themeMode;
  const UserSetting(
      {required this.userId, required this.theme, required this.themeMode});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['user_id'] = Variable<String>(userId);
    map['theme'] = Variable<String>(theme);
    map['theme_mode'] = Variable<String>(themeMode);
    return map;
  }

  UserSettingsCompanion toCompanion(bool nullToAbsent) {
    return UserSettingsCompanion(
      userId: Value(userId),
      theme: Value(theme),
      themeMode: Value(themeMode),
    );
  }

  factory UserSetting.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserSetting(
      userId: serializer.fromJson<String>(json['userId']),
      theme: serializer.fromJson<String>(json['theme']),
      themeMode: serializer.fromJson<String>(json['themeMode']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'userId': serializer.toJson<String>(userId),
      'theme': serializer.toJson<String>(theme),
      'themeMode': serializer.toJson<String>(themeMode),
    };
  }

  UserSetting copyWith({String? userId, String? theme, String? themeMode}) =>
      UserSetting(
        userId: userId ?? this.userId,
        theme: theme ?? this.theme,
        themeMode: themeMode ?? this.themeMode,
      );
  UserSetting copyWithCompanion(UserSettingsCompanion data) {
    return UserSetting(
      userId: data.userId.present ? data.userId.value : this.userId,
      theme: data.theme.present ? data.theme.value : this.theme,
      themeMode: data.themeMode.present ? data.themeMode.value : this.themeMode,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserSetting(')
          ..write('userId: $userId, ')
          ..write('theme: $theme, ')
          ..write('themeMode: $themeMode')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(userId, theme, themeMode);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserSetting &&
          other.userId == this.userId &&
          other.theme == this.theme &&
          other.themeMode == this.themeMode);
}

class UserSettingsCompanion extends UpdateCompanion<UserSetting> {
  final Value<String> userId;
  final Value<String> theme;
  final Value<String> themeMode;
  final Value<int> rowid;
  const UserSettingsCompanion({
    this.userId = const Value.absent(),
    this.theme = const Value.absent(),
    this.themeMode = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UserSettingsCompanion.insert({
    required String userId,
    required String theme,
    required String themeMode,
    this.rowid = const Value.absent(),
  })  : userId = Value(userId),
        theme = Value(theme),
        themeMode = Value(themeMode);
  static Insertable<UserSetting> custom({
    Expression<String>? userId,
    Expression<String>? theme,
    Expression<String>? themeMode,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (userId != null) 'user_id': userId,
      if (theme != null) 'theme': theme,
      if (themeMode != null) 'theme_mode': themeMode,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UserSettingsCompanion copyWith(
      {Value<String>? userId,
      Value<String>? theme,
      Value<String>? themeMode,
      Value<int>? rowid}) {
    return UserSettingsCompanion(
      userId: userId ?? this.userId,
      theme: theme ?? this.theme,
      themeMode: themeMode ?? this.themeMode,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (theme.present) {
      map['theme'] = Variable<String>(theme.value);
    }
    if (themeMode.present) {
      map['theme_mode'] = Variable<String>(themeMode.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserSettingsCompanion(')
          ..write('userId: $userId, ')
          ..write('theme: $theme, ')
          ..write('themeMode: $themeMode, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $PodcastsTable podcasts = $PodcastsTable(this);
  late final $PodcastSearchHistoryTable podcastSearchHistory =
      $PodcastSearchHistoryTable(this);
  late final $UserSettingsTable userSettings = $UserSettingsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [podcasts, podcastSearchHistory, userSettings];
}

typedef $$PodcastsTableCreateCompanionBuilder = PodcastsCompanion Function({
  Value<int> id,
  required String podcastGuid,
  required String title,
  required String url,
  required String originalUrl,
  required String link,
  required String description,
  required String author,
  required String ownerName,
  required String image,
  required String artwork,
  required int lastUpdateTime,
  required int lastCrawlTime,
  required int lastParseTime,
  required int lastGoodHttpStatusTime,
  required int lastHttpStatus,
  required String contentType,
  Value<int?> itunesId,
  Value<String?> itunesType,
  Value<String?> generator,
  required String language,
  required bool explicit,
  required int type,
  required String medium,
  required int dead,
  Value<String?> chash,
  required int episodeCount,
  required int crawlErrors,
  required int parseErrors,
  Value<Map<String, dynamic>?> categories,
  required int locked,
  required int imageUrlHash,
  Value<Map<String, dynamic>?> value,
  Value<Map<String, dynamic>?> funding,
  Value<int?> newestItemPubdate,
  Value<DateTime?> updatedAt,
});
typedef $$PodcastsTableUpdateCompanionBuilder = PodcastsCompanion Function({
  Value<int> id,
  Value<String> podcastGuid,
  Value<String> title,
  Value<String> url,
  Value<String> originalUrl,
  Value<String> link,
  Value<String> description,
  Value<String> author,
  Value<String> ownerName,
  Value<String> image,
  Value<String> artwork,
  Value<int> lastUpdateTime,
  Value<int> lastCrawlTime,
  Value<int> lastParseTime,
  Value<int> lastGoodHttpStatusTime,
  Value<int> lastHttpStatus,
  Value<String> contentType,
  Value<int?> itunesId,
  Value<String?> itunesType,
  Value<String?> generator,
  Value<String> language,
  Value<bool> explicit,
  Value<int> type,
  Value<String> medium,
  Value<int> dead,
  Value<String?> chash,
  Value<int> episodeCount,
  Value<int> crawlErrors,
  Value<int> parseErrors,
  Value<Map<String, dynamic>?> categories,
  Value<int> locked,
  Value<int> imageUrlHash,
  Value<Map<String, dynamic>?> value,
  Value<Map<String, dynamic>?> funding,
  Value<int?> newestItemPubdate,
  Value<DateTime?> updatedAt,
});

class $$PodcastsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $PodcastsTable,
    Podcast,
    $$PodcastsTableFilterComposer,
    $$PodcastsTableOrderingComposer,
    $$PodcastsTableCreateCompanionBuilder,
    $$PodcastsTableUpdateCompanionBuilder> {
  $$PodcastsTableTableManager(_$AppDatabase db, $PodcastsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$PodcastsTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$PodcastsTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> podcastGuid = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String> url = const Value.absent(),
            Value<String> originalUrl = const Value.absent(),
            Value<String> link = const Value.absent(),
            Value<String> description = const Value.absent(),
            Value<String> author = const Value.absent(),
            Value<String> ownerName = const Value.absent(),
            Value<String> image = const Value.absent(),
            Value<String> artwork = const Value.absent(),
            Value<int> lastUpdateTime = const Value.absent(),
            Value<int> lastCrawlTime = const Value.absent(),
            Value<int> lastParseTime = const Value.absent(),
            Value<int> lastGoodHttpStatusTime = const Value.absent(),
            Value<int> lastHttpStatus = const Value.absent(),
            Value<String> contentType = const Value.absent(),
            Value<int?> itunesId = const Value.absent(),
            Value<String?> itunesType = const Value.absent(),
            Value<String?> generator = const Value.absent(),
            Value<String> language = const Value.absent(),
            Value<bool> explicit = const Value.absent(),
            Value<int> type = const Value.absent(),
            Value<String> medium = const Value.absent(),
            Value<int> dead = const Value.absent(),
            Value<String?> chash = const Value.absent(),
            Value<int> episodeCount = const Value.absent(),
            Value<int> crawlErrors = const Value.absent(),
            Value<int> parseErrors = const Value.absent(),
            Value<Map<String, dynamic>?> categories = const Value.absent(),
            Value<int> locked = const Value.absent(),
            Value<int> imageUrlHash = const Value.absent(),
            Value<Map<String, dynamic>?> value = const Value.absent(),
            Value<Map<String, dynamic>?> funding = const Value.absent(),
            Value<int?> newestItemPubdate = const Value.absent(),
            Value<DateTime?> updatedAt = const Value.absent(),
          }) =>
              PodcastsCompanion(
            id: id,
            podcastGuid: podcastGuid,
            title: title,
            url: url,
            originalUrl: originalUrl,
            link: link,
            description: description,
            author: author,
            ownerName: ownerName,
            image: image,
            artwork: artwork,
            lastUpdateTime: lastUpdateTime,
            lastCrawlTime: lastCrawlTime,
            lastParseTime: lastParseTime,
            lastGoodHttpStatusTime: lastGoodHttpStatusTime,
            lastHttpStatus: lastHttpStatus,
            contentType: contentType,
            itunesId: itunesId,
            itunesType: itunesType,
            generator: generator,
            language: language,
            explicit: explicit,
            type: type,
            medium: medium,
            dead: dead,
            chash: chash,
            episodeCount: episodeCount,
            crawlErrors: crawlErrors,
            parseErrors: parseErrors,
            categories: categories,
            locked: locked,
            imageUrlHash: imageUrlHash,
            value: value,
            funding: funding,
            newestItemPubdate: newestItemPubdate,
            updatedAt: updatedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String podcastGuid,
            required String title,
            required String url,
            required String originalUrl,
            required String link,
            required String description,
            required String author,
            required String ownerName,
            required String image,
            required String artwork,
            required int lastUpdateTime,
            required int lastCrawlTime,
            required int lastParseTime,
            required int lastGoodHttpStatusTime,
            required int lastHttpStatus,
            required String contentType,
            Value<int?> itunesId = const Value.absent(),
            Value<String?> itunesType = const Value.absent(),
            Value<String?> generator = const Value.absent(),
            required String language,
            required bool explicit,
            required int type,
            required String medium,
            required int dead,
            Value<String?> chash = const Value.absent(),
            required int episodeCount,
            required int crawlErrors,
            required int parseErrors,
            Value<Map<String, dynamic>?> categories = const Value.absent(),
            required int locked,
            required int imageUrlHash,
            Value<Map<String, dynamic>?> value = const Value.absent(),
            Value<Map<String, dynamic>?> funding = const Value.absent(),
            Value<int?> newestItemPubdate = const Value.absent(),
            Value<DateTime?> updatedAt = const Value.absent(),
          }) =>
              PodcastsCompanion.insert(
            id: id,
            podcastGuid: podcastGuid,
            title: title,
            url: url,
            originalUrl: originalUrl,
            link: link,
            description: description,
            author: author,
            ownerName: ownerName,
            image: image,
            artwork: artwork,
            lastUpdateTime: lastUpdateTime,
            lastCrawlTime: lastCrawlTime,
            lastParseTime: lastParseTime,
            lastGoodHttpStatusTime: lastGoodHttpStatusTime,
            lastHttpStatus: lastHttpStatus,
            contentType: contentType,
            itunesId: itunesId,
            itunesType: itunesType,
            generator: generator,
            language: language,
            explicit: explicit,
            type: type,
            medium: medium,
            dead: dead,
            chash: chash,
            episodeCount: episodeCount,
            crawlErrors: crawlErrors,
            parseErrors: parseErrors,
            categories: categories,
            locked: locked,
            imageUrlHash: imageUrlHash,
            value: value,
            funding: funding,
            newestItemPubdate: newestItemPubdate,
            updatedAt: updatedAt,
          ),
        ));
}

class $$PodcastsTableFilterComposer
    extends FilterComposer<_$AppDatabase, $PodcastsTable> {
  $$PodcastsTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get podcastGuid => $state.composableBuilder(
      column: $state.table.podcastGuid,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get title => $state.composableBuilder(
      column: $state.table.title,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get url => $state.composableBuilder(
      column: $state.table.url,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get originalUrl => $state.composableBuilder(
      column: $state.table.originalUrl,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get link => $state.composableBuilder(
      column: $state.table.link,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get description => $state.composableBuilder(
      column: $state.table.description,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get author => $state.composableBuilder(
      column: $state.table.author,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get ownerName => $state.composableBuilder(
      column: $state.table.ownerName,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get image => $state.composableBuilder(
      column: $state.table.image,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get artwork => $state.composableBuilder(
      column: $state.table.artwork,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get lastUpdateTime => $state.composableBuilder(
      column: $state.table.lastUpdateTime,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get lastCrawlTime => $state.composableBuilder(
      column: $state.table.lastCrawlTime,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get lastParseTime => $state.composableBuilder(
      column: $state.table.lastParseTime,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get lastGoodHttpStatusTime => $state.composableBuilder(
      column: $state.table.lastGoodHttpStatusTime,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get lastHttpStatus => $state.composableBuilder(
      column: $state.table.lastHttpStatus,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get contentType => $state.composableBuilder(
      column: $state.table.contentType,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get itunesId => $state.composableBuilder(
      column: $state.table.itunesId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get itunesType => $state.composableBuilder(
      column: $state.table.itunesType,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get generator => $state.composableBuilder(
      column: $state.table.generator,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get language => $state.composableBuilder(
      column: $state.table.language,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get explicit => $state.composableBuilder(
      column: $state.table.explicit,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get type => $state.composableBuilder(
      column: $state.table.type,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get medium => $state.composableBuilder(
      column: $state.table.medium,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get dead => $state.composableBuilder(
      column: $state.table.dead,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get chash => $state.composableBuilder(
      column: $state.table.chash,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get episodeCount => $state.composableBuilder(
      column: $state.table.episodeCount,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get crawlErrors => $state.composableBuilder(
      column: $state.table.crawlErrors,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get parseErrors => $state.composableBuilder(
      column: $state.table.parseErrors,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnWithTypeConverterFilters<Map<String, dynamic>?, Map<String, dynamic>,
          String>
      get categories => $state.composableBuilder(
          column: $state.table.categories,
          builder: (column, joinBuilders) => ColumnWithTypeConverterFilters(
              column,
              joinBuilders: joinBuilders));

  ColumnFilters<int> get locked => $state.composableBuilder(
      column: $state.table.locked,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get imageUrlHash => $state.composableBuilder(
      column: $state.table.imageUrlHash,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnWithTypeConverterFilters<Map<String, dynamic>?, Map<String, dynamic>,
          String>
      get value => $state.composableBuilder(
          column: $state.table.value,
          builder: (column, joinBuilders) => ColumnWithTypeConverterFilters(
              column,
              joinBuilders: joinBuilders));

  ColumnWithTypeConverterFilters<Map<String, dynamic>?, Map<String, dynamic>,
          String>
      get funding => $state.composableBuilder(
          column: $state.table.funding,
          builder: (column, joinBuilders) => ColumnWithTypeConverterFilters(
              column,
              joinBuilders: joinBuilders));

  ColumnFilters<int> get newestItemPubdate => $state.composableBuilder(
      column: $state.table.newestItemPubdate,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get updatedAt => $state.composableBuilder(
      column: $state.table.updatedAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ComposableFilter podcastSearchHistoryRefs(
      ComposableFilter Function($$PodcastSearchHistoryTableFilterComposer f)
          f) {
    final $$PodcastSearchHistoryTableFilterComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $state.db.podcastSearchHistory,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder, parentComposers) =>
                $$PodcastSearchHistoryTableFilterComposer(ComposerState(
                    $state.db,
                    $state.db.podcastSearchHistory,
                    joinBuilder,
                    parentComposers)));
    return f(composer);
  }
}

class $$PodcastsTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $PodcastsTable> {
  $$PodcastsTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get podcastGuid => $state.composableBuilder(
      column: $state.table.podcastGuid,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get title => $state.composableBuilder(
      column: $state.table.title,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get url => $state.composableBuilder(
      column: $state.table.url,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get originalUrl => $state.composableBuilder(
      column: $state.table.originalUrl,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get link => $state.composableBuilder(
      column: $state.table.link,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get description => $state.composableBuilder(
      column: $state.table.description,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get author => $state.composableBuilder(
      column: $state.table.author,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get ownerName => $state.composableBuilder(
      column: $state.table.ownerName,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get image => $state.composableBuilder(
      column: $state.table.image,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get artwork => $state.composableBuilder(
      column: $state.table.artwork,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get lastUpdateTime => $state.composableBuilder(
      column: $state.table.lastUpdateTime,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get lastCrawlTime => $state.composableBuilder(
      column: $state.table.lastCrawlTime,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get lastParseTime => $state.composableBuilder(
      column: $state.table.lastParseTime,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get lastGoodHttpStatusTime => $state.composableBuilder(
      column: $state.table.lastGoodHttpStatusTime,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get lastHttpStatus => $state.composableBuilder(
      column: $state.table.lastHttpStatus,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get contentType => $state.composableBuilder(
      column: $state.table.contentType,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get itunesId => $state.composableBuilder(
      column: $state.table.itunesId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get itunesType => $state.composableBuilder(
      column: $state.table.itunesType,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get generator => $state.composableBuilder(
      column: $state.table.generator,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get language => $state.composableBuilder(
      column: $state.table.language,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get explicit => $state.composableBuilder(
      column: $state.table.explicit,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get type => $state.composableBuilder(
      column: $state.table.type,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get medium => $state.composableBuilder(
      column: $state.table.medium,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get dead => $state.composableBuilder(
      column: $state.table.dead,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get chash => $state.composableBuilder(
      column: $state.table.chash,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get episodeCount => $state.composableBuilder(
      column: $state.table.episodeCount,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get crawlErrors => $state.composableBuilder(
      column: $state.table.crawlErrors,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get parseErrors => $state.composableBuilder(
      column: $state.table.parseErrors,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get categories => $state.composableBuilder(
      column: $state.table.categories,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get locked => $state.composableBuilder(
      column: $state.table.locked,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get imageUrlHash => $state.composableBuilder(
      column: $state.table.imageUrlHash,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get value => $state.composableBuilder(
      column: $state.table.value,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get funding => $state.composableBuilder(
      column: $state.table.funding,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get newestItemPubdate => $state.composableBuilder(
      column: $state.table.newestItemPubdate,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get updatedAt => $state.composableBuilder(
      column: $state.table.updatedAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$PodcastSearchHistoryTableCreateCompanionBuilder
    = PodcastSearchHistoryCompanion Function({
  Value<int> id,
  required DateTime searchedAt,
});
typedef $$PodcastSearchHistoryTableUpdateCompanionBuilder
    = PodcastSearchHistoryCompanion Function({
  Value<int> id,
  Value<DateTime> searchedAt,
});

class $$PodcastSearchHistoryTableTableManager extends RootTableManager<
    _$AppDatabase,
    $PodcastSearchHistoryTable,
    PodcastSearchHistoryData,
    $$PodcastSearchHistoryTableFilterComposer,
    $$PodcastSearchHistoryTableOrderingComposer,
    $$PodcastSearchHistoryTableCreateCompanionBuilder,
    $$PodcastSearchHistoryTableUpdateCompanionBuilder> {
  $$PodcastSearchHistoryTableTableManager(
      _$AppDatabase db, $PodcastSearchHistoryTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer: $$PodcastSearchHistoryTableFilterComposer(
              ComposerState(db, table)),
          orderingComposer: $$PodcastSearchHistoryTableOrderingComposer(
              ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<DateTime> searchedAt = const Value.absent(),
          }) =>
              PodcastSearchHistoryCompanion(
            id: id,
            searchedAt: searchedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required DateTime searchedAt,
          }) =>
              PodcastSearchHistoryCompanion.insert(
            id: id,
            searchedAt: searchedAt,
          ),
        ));
}

class $$PodcastSearchHistoryTableFilterComposer
    extends FilterComposer<_$AppDatabase, $PodcastSearchHistoryTable> {
  $$PodcastSearchHistoryTableFilterComposer(super.$state);
  ColumnFilters<DateTime> get searchedAt => $state.composableBuilder(
      column: $state.table.searchedAt,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  $$PodcastsTableFilterComposer get id {
    final $$PodcastsTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.podcasts,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$PodcastsTableFilterComposer(ComposerState(
                $state.db, $state.db.podcasts, joinBuilder, parentComposers)));
    return composer;
  }
}

class $$PodcastSearchHistoryTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $PodcastSearchHistoryTable> {
  $$PodcastSearchHistoryTableOrderingComposer(super.$state);
  ColumnOrderings<DateTime> get searchedAt => $state.composableBuilder(
      column: $state.table.searchedAt,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  $$PodcastsTableOrderingComposer get id {
    final $$PodcastsTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $state.db.podcasts,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$PodcastsTableOrderingComposer(ComposerState(
                $state.db, $state.db.podcasts, joinBuilder, parentComposers)));
    return composer;
  }
}

typedef $$UserSettingsTableCreateCompanionBuilder = UserSettingsCompanion
    Function({
  required String userId,
  required String theme,
  required String themeMode,
  Value<int> rowid,
});
typedef $$UserSettingsTableUpdateCompanionBuilder = UserSettingsCompanion
    Function({
  Value<String> userId,
  Value<String> theme,
  Value<String> themeMode,
  Value<int> rowid,
});

class $$UserSettingsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $UserSettingsTable,
    UserSetting,
    $$UserSettingsTableFilterComposer,
    $$UserSettingsTableOrderingComposer,
    $$UserSettingsTableCreateCompanionBuilder,
    $$UserSettingsTableUpdateCompanionBuilder> {
  $$UserSettingsTableTableManager(_$AppDatabase db, $UserSettingsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$UserSettingsTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$UserSettingsTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<String> userId = const Value.absent(),
            Value<String> theme = const Value.absent(),
            Value<String> themeMode = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              UserSettingsCompanion(
            userId: userId,
            theme: theme,
            themeMode: themeMode,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String userId,
            required String theme,
            required String themeMode,
            Value<int> rowid = const Value.absent(),
          }) =>
              UserSettingsCompanion.insert(
            userId: userId,
            theme: theme,
            themeMode: themeMode,
            rowid: rowid,
          ),
        ));
}

class $$UserSettingsTableFilterComposer
    extends FilterComposer<_$AppDatabase, $UserSettingsTable> {
  $$UserSettingsTableFilterComposer(super.$state);
  ColumnFilters<String> get userId => $state.composableBuilder(
      column: $state.table.userId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get theme => $state.composableBuilder(
      column: $state.table.theme,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get themeMode => $state.composableBuilder(
      column: $state.table.themeMode,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$UserSettingsTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $UserSettingsTable> {
  $$UserSettingsTableOrderingComposer(super.$state);
  ColumnOrderings<String> get userId => $state.composableBuilder(
      column: $state.table.userId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get theme => $state.composableBuilder(
      column: $state.table.theme,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get themeMode => $state.composableBuilder(
      column: $state.table.themeMode,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$PodcastsTableTableManager get podcasts =>
      $$PodcastsTableTableManager(_db, _db.podcasts);
  $$PodcastSearchHistoryTableTableManager get podcastSearchHistory =>
      $$PodcastSearchHistoryTableTableManager(_db, _db.podcastSearchHistory);
  $$UserSettingsTableTableManager get userSettings =>
      $$UserSettingsTableTableManager(_db, _db.userSettings);
}
