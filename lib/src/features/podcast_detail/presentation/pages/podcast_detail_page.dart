import 'package:flutter/material.dart';
import 'package:zaracast/src/core/dependency_injection/singletons.dart';
import 'package:zaracast/src/core/styles/style_sheet.dart';
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
      controller: _scrollController,
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
              onPressed: () async {
                final filter = await zShowModalBottomSheet<String>(
                  context,
                  ListTile(
                    leading: SizedBox(
                      height: 64,
                      width: 64,
                      child: CachedNetworkImageBuilder(
                        imageUrl:
                            'https://i.pinimg.com/originals/59/de/4f/59de4fb27cd342f038e2d90ea75bcea0.jpg',
                        prefs: prefs,
                      ),
                    ),
                    title: Text(
                      widget.title ?? 'Place holder',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  [
                    const BottomSheetListItem(
                      icon: Icons.library_add_check,
                      name: 'Subscribe',
                      value: 'Subscribe',
                      selected: false,
                    ),
                    const BottomSheetListItem(
                      icon: Icons.playlist_add_check,
                      name: 'Mark all as played',
                      value: 'Mark all as played',
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
                      Text(
                        'Filter by',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
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
                  iconAlignment: IconAlignment.end,
                  icon: const Icon(Icons.sort),
                  label: const Text('Oldest'),
                  onPressed: () => print('sort'),
                ),
              ],
            ),
          ),
        ),

        SliverList.separated(
          itemCount: 10,
          separatorBuilder: (context, index) => const Divider(
            indent: 16,
            endIndent: 16,
          ),
          itemBuilder: (context, index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Text(
                    '454 • 5 days ago',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
                ListTile(
                  leading: SizedBox(
                    height: 64,
                    width: 64,
                    child: CachedNetworkImageBuilder(
                      imageUrl:
                          'https://i.pinimg.com/originals/59/de/4f/59de4fb27cd342f038e2d90ea75bcea0.jpg',
                      prefs: prefs,
                    ),
                  ),
                  title: const Text('This Is The Episode Title'),
                  subtitle: const Text(
                    'This can be the description that may wrap a couple lines and then eventually it will finish but keep going and we will show an...',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.more_vert),
                    onPressed: () async {
                      final filter = await zShowModalBottomSheet<String>(
                        context,
                        ListTile(
                          leading: SizedBox(
                            height: 64,
                            width: 64,
                            child: CachedNetworkImageBuilder(
                              imageUrl:
                                  'https://i.pinimg.com/originals/59/de/4f/59de4fb27cd342f038e2d90ea75bcea0.jpg',
                              prefs: prefs,
                            ),
                          ),
                          title: const Text('This Is The Episode Title'),
                          subtitle: const Text(
                            '454 • 5 days ago',
                          ),
                        ),
                        [
                          const BottomSheetListItem(
                            icon: Icons.play_arrow,
                            name: 'Play next',
                            value: 'Play next',
                            selected: false,
                          ),
                          const BottomSheetListItem(
                            icon: Icons.playlist_add,
                            name: 'Add to queue',
                            value: 'Add to queue',
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
                  onTap: () => print('episode detail'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      FilledButton.icon(
                        icon: const Icon(Icons.play_arrow),
                        label: const Text('2h 53m'),
                        style: ButtonStyle(
                          padding: WidgetStateProperty.all(
                            const EdgeInsets.symmetric(horizontal: 8),
                          ),
                          iconSize: WidgetStateProperty.all(16),
                          textStyle: WidgetStateProperty.all(
                            Theme.of(context).textTheme.bodySmall,
                          ),
                          visualDensity: VisualDensity.compact,
                        ),
                        onPressed: () => print('play'),
                      ),
                      IconButton(
                        icon: const Icon(Icons.bookmark_add),
                        onPressed: () => print('bookmark'),
                      ),
                      IconButton(
                        icon: const Icon(Icons.download),
                        onPressed: () => print('download'),
                      ),
                      IconButton(
                        icon: const Icon(Icons.playlist_add_check),
                        onPressed: () => print('mark as played'),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
        const SliverToBoxAdapter(child: Divider(indent: 16, endIndent: 16)),
        SliverPadding(
          padding: const EdgeInsets.only(left: 16),
          sliver: SliverToBoxAdapter(
            child: Align(
              alignment: Alignment.centerLeft,
              child: TextButton.icon(
                iconAlignment: IconAlignment.end,
                icon: const Icon(Icons.chevron_right),
                label: const Text('See all unplayed'),
                onPressed: () => 'go see all unplayed',
              ),
            ),
          ),
        ),
      ],
    );
  }
}
