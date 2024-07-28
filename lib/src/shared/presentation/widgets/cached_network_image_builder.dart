import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// TODO(red): When clicking Clear Cache, need to clear SearchBloc state as well
//   to prevent scheduler library exceptions.
//   JAKE ALSO MAKE SEARCH BAR A SLIVERAPPBAR THATS FLOATING???
class CachedNetworkImageBuilder extends StatefulWidget {
  const CachedNetworkImageBuilder({
    required this.imageUrl,
    required this.prefs,
    super.key,
  });

  final String imageUrl;
  final SharedPreferences prefs;

  @override
  State<CachedNetworkImageBuilder> createState() =>
      _CachedNetworkImageBuilderState();
}

class _CachedNetworkImageBuilderState extends State<CachedNetworkImageBuilder> {
  late String imageUrl;
  late bool showImage;

  @override
  void initState() {
    if (widget.imageUrl.isEmpty) {
      imageUrl = '';
      showImage = false;
    } else {
      imageUrl = _cleanUrl(widget.imageUrl);
      showImage = !_isBlacklistedUrl(imageUrl);
    }

    super.initState();
  }

  String _cleanUrl(String url) {
    // Remove all characters before the first 'http' in the URL.
    return url.replaceAll(RegExp('^.*?(?=http)'), '');
  }

  Future<void> _blacklistUrl(String url) async {
    await widget.prefs.setBool('BLACKLIST_URL_$url', true);
  }

  bool _isBlacklistedUrl(String url) {
    return widget.prefs.getBool('BLACKLIST_URL_$url') ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: showImage,
      replacement: const Icon(Icons.image_not_supported),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        placeholder: (context, url) => const Icon(Icons.image),
        errorWidget: (context, url, error) {
          if (error is HttpException) {
            if (kDebugMode) {
              debugPrint('CachedNetworkImage blacklisting URL: $url');
            }
            _blacklistUrl(url);
          }
          return const Icon(Icons.image_not_supported);
        },
      ),
    );
  }
}
