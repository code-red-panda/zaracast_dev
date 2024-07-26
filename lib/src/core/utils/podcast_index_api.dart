import 'dart:convert';

import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';

class PodcastIndex {
  const PodcastIndex({
    required String apiKey,
    required String apiSecret,
    required String userAgent,
  })  : _apiKey = apiKey,
        _apiSecret = apiSecret,
        _userAgent = userAgent,
        super();

  final String _apiKey;
  final String _apiSecret;
  final String _userAgent;

  Map<String, String> get buildHeaders {
    final unixTime =
        '${(DateTime.now().millisecondsSinceEpoch / 1000).round()}';

    final firstChunk = utf8.encode(_apiKey);
    final secondChunk = utf8.encode(_apiSecret);
    final thirdChunk = utf8.encode(unixTime);
    final output = AccumulatorSink<Digest>();

    sha1.startChunkedConversion(output)
      ..add(firstChunk)
      ..add(secondChunk)
      ..add(thirdChunk)
      ..close();

    final digest = output.events.single;

    return {
      'X-Auth-Date': unixTime,
      'X-Auth-Key': _apiKey,
      'Authorization': digest.toString(),
      'User-Agent': _userAgent,
    };
  }
}
