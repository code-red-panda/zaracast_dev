import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zaracast/src/features/search/data/dependency_injection/search_singletons.dart';
import 'package:zaracast/src/features/search/presentation/widgets/podcast_search_bar.dart';
import 'package:zaracast/src/shared/presentation/widgets/sliver_app_bar_builder.dart';

class DiscoverPage extends StatelessWidget {
  const DiscoverPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => searchBloc,
      child: const DiscoverPageChild(),
    );
  }
}

class DiscoverPageChild extends StatefulWidget {
  const DiscoverPageChild({super.key});

  @override
  State<DiscoverPageChild> createState() => _DiscoverPageChildState();
}

class _DiscoverPageChildState extends State<DiscoverPageChild>
    with SingleTickerProviderStateMixin {
  late ScrollController _scrollController;

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
      //physics: const BouncingScrollPhysics(),
      slivers: [
        SliverAppBarBuilder.largeTitle(
          title: 'Discover',
          scrollController: _scrollController,
        ),
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: PodcastSearchBar(),
          ),
        ),
      ],
    );
  }
}
