import 'package:flutter/widgets.dart';
import 'package:zaracast/src/shared/presentation/widgets/sliver_app_bar_builder.dart';

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
        SliverAppBarBuilder.largeTitle(
          title: widget.title ?? 'My Placeholder Title Displayed Here',
          scrollController: _scrollController,
        ),
      ],
    );
  }
}
