import 'package:flutter/material.dart';
import 'package:zaracast/src/core/dependency_injection/singletons.dart';
import 'package:zaracast/src/core/styles/style_sheet.dart';
import 'package:zaracast/src/core/themes/material_theme_builder.dart';
import 'package:zaracast/src/shared/presentation/utils/bottom_sheets.dart';
import 'package:zaracast/src/shared/presentation/widgets/cached_network_image_builder.dart';
import 'package:zaracast/src/shared/presentation/widgets/sliver_app_bar_builder.dart';

enum EpisodeFilter { all, unplayed, played, downloaded }

enum EpisodeSort { newest, oldest }

class PodcastDetailPage extends StatelessWidget {
  const PodcastDetailPage({required this.id, this.title, super.key});

  final int id;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return PodcastDetailPageChild(id: id, title: title);
  }
}

class PodcastDetailPageChild extends StatefulWidget {
  const PodcastDetailPageChild({required this.id, this.title, super.key});

  final int id;
  final String? title;

  @override
  State<PodcastDetailPageChild> createState() => _PodcastDetailPageChildState();
}

class _PodcastDetailPageChildState extends State<PodcastDetailPageChild> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBarBuilder(
          title: widget.title ?? 'My Placeholder Title Displayed Here',
          actions: [
            TextButton.icon(
              icon: const Icon(Icons.library_add_check),
              label: const Text('Subscribe'),
              onPressed: () => print('subscribe'),
            ),
            IconButton(
              icon: const Icon(Icons.more_vert),
              onPressed: () {
                print('more');
              },
            ),
          ],
        ),
        // TODO(red): transform to loading indicator
        const SliverToBoxAdapter(child: SizedBox(height: 16)),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 64),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppStyleSheet.rMedium),
              child: CachedNetworkImageBuilder(
                imageUrl:
                    'https://i.pinimg.com/originals/59/de/4f/59de4fb27cd342f038e2d90ea75bcea0.jpg',
                prefs: prefs,
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton.icon(
                  iconAlignment: IconAlignment.end,
                  icon: const Icon(Icons.arrow_drop_down),
                  label: const Text('Unplayed'),
                  onPressed: () async {
                    final filter = await zShowModalBottomSheet<EpisodeFilter>(
                      context,
                      'Filter by',
                      [
                        const BottomSheetListItem(
                          icon: Icons.notes,
                          name: 'All',
                          value: EpisodeFilter.all,
                          selected: true, //state == MaterialTheme.ghostSpider,
                        ),
                        const BottomSheetListItem(
                          icon: Icons.playlist_play,
                          name: 'Unplayed',
                          value: EpisodeFilter.unplayed,
                          selected: false,
                        ),
                        const BottomSheetListItem(
                          icon: Icons.playlist_add_check,
                          name: 'Played',
                          value: EpisodeFilter.played,
                          selected: false,
                        ),
                        const BottomSheetListItem(
                          icon: Icons.download,
                          name: 'Downloaded',
                          value: EpisodeFilter.downloaded,
                          selected: false,
                        ),
                      ],
                    );

                    if (filter != null) {
                      //  final params = UpdateThemeParams(
                      //    userId: placeHolderUserId,
                      //    theme: theme,
                      //  );

                      if (!context.mounted) return;
                      //   context
                      //       .read<SettingsBloc>()
                      //       .add(UpdateThemeEvent(params));
                    }
                  },
                ),
                TextButton.icon(
                  label: const Text('Sort by: oldest'),
                  onPressed: () => print('sort'),
                ),
              ],
            ),
          ),
        ),
        const SliverToBoxAdapter(child: Divider(indent: 16, endIndent: 16)),
        SliverList.separated(
          itemCount: 10,
          separatorBuilder: (context, index) => const Divider(
            indent: 16,
            endIndent: 16,
          ),
          itemBuilder: (context, index) {
            return ListTile(
              //minTileHeight: 124,
              leading: SizedBox(
                height: 64,
                width: 64,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CachedNetworkImageBuilder(
                      imageUrl:
                          'https://i.pinimg.com/originals/59/de/4f/59de4fb27cd342f038e2d90ea75bcea0.jpg',
                      prefs: prefs,
                    ),
                  ],
                ),
              ),
              title: const Text('This Is The Episode Title'),
              subtitle: const Text('Episode Description'),
              isThreeLine: true,
              trailing: const Text('1:23:45'),
              onTap: () => print('play'),
            );
          },
        ),
      ],
    );
  }
}
