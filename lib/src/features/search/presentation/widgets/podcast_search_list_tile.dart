import 'package:flutter/material.dart';
import 'package:zaracast/src/core/dependency_injection/singletons.dart';
import 'package:zaracast/src/features/podcast/domain/entities/podcast_entity.dart';
import 'package:zaracast/src/shared/presentation/widgets/cached_network_image_builder.dart';

class PodcastSearchListTile extends StatelessWidget {
  const PodcastSearchListTile({
    required this.podcast,
    this.trailing,
    this.onTap,
    super.key,
  });

  final PodcastEntity podcast;
  final Widget? trailing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final categories = podcast.categories?.values.take(2).join(' · ') ?? '';

    return ListTile(
      leading: SizedBox(
        height: 64,
        width: 64,
        child: CachedNetworkImageBuilder(
          imageUrl: podcast.image,
          prefs: prefs,
        ),
      ),
      title: Text(
        podcast.title,
        maxLines: 2,
        softWrap: true,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(
        categories,
        maxLines: 1,
        softWrap: true,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: SizedBox(
        height: 64,
        width: 64,
        child: trailing,
      ),
      onTap: onTap,
    );
  }
}
