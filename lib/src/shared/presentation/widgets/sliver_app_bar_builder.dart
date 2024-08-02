import 'dart:ui';

import 'package:flutter/material.dart';

enum SliverAppBarSize { small, medium, large }

/// Padding and heights came from M3 specs:
/// https://m3.material.io/components/top-app-bar/specs
class SliverAppBarBuilder extends StatefulWidget {
  const SliverAppBarBuilder({
    required this.title,
    this.actions,
    super.key,
  })  : size = SliverAppBarSize.small,
        animateActions = false,
        scrollController = null;

  const SliverAppBarBuilder.medium({
    required this.title,
    this.actions,
    super.key,
  })  : size = SliverAppBarSize.medium,
        animateActions = false,
        scrollController = null;

  const SliverAppBarBuilder.large({
    required this.title,
    required ScrollController this.scrollController,
    this.animateActions = false,
    this.actions,
    super.key,
  }) : size = SliverAppBarSize.large;

  final String title;
  final SliverAppBarSize size;

  // If [animateActions] is true, the actions will fade in and out based on the
  // scroll position with the title.
  final bool animateActions;
  final ScrollController? scrollController;
  final List<Widget>? actions;

  @override
  State<SliverAppBarBuilder> createState() => _SliverAppBarBuilderState();
}

class _SliverAppBarBuilderState extends State<SliverAppBarBuilder> {
  late double _expandedHeight;
  late double _flexibleSpaceOpacity;
  late double _titleOpacity;

  @override
  void initState() {
    super.initState();

    if (widget.size == SliverAppBarSize.large) {
      // The [_expandedHeight] is following M3 Large top app bar sizing
      // https://m3.material.io/components/top-app-bar/specs#3f23d082-0dd6-4358-a6c9-2c6d72f1cd7a
      _expandedHeight = 152;
      _flexibleSpaceOpacity = 1;
      _titleOpacity = 0;
      widget.scrollController?.addListener(_scrollListener);
    } else if (widget.size == SliverAppBarSize.medium) {
      // The [_expandedHeight] is following M3 Medium top app bar sizing
      // https://m3.material.io/components/top-app-bar/specs#3f23d082-0dd6-4358-a6c9-2c6d72f1cd7a
      _expandedHeight = 112;
    }
  }

  void _scrollListener() {
    final offset = widget.scrollController?.offset ?? 0;

    setState(() {
      _flexibleSpaceOpacity =
          1 - (offset / (_expandedHeight - kToolbarHeight)).clamp(0.0, 1.0);

      // [_titleOpacity] begins to fade in when the flexible space has fully
      // faded out
      _titleOpacity =
          (offset - (_expandedHeight - kToolbarHeight)) / kToolbarHeight;
      _titleOpacity = _titleOpacity.clamp(0.0, 1.0);
    });
  }

  @override
  void dispose() {
    // Do not dispose the scroll controller here. That must be handled by the
    // parent widget.
    widget.scrollController?.removeListener(_scrollListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    switch (widget.size) {
      case SliverAppBarSize.small:
        return _buildSmallTitleAppBar();
      case SliverAppBarSize.medium:
        return _buildMediumTitleAppBar();
      case SliverAppBarSize.large:
        return _buildLargeTitleAppBar();
    }
  }

  SliverAppBar _buildSmallTitleAppBar() {
    return SliverAppBar(
      actions: widget.actions,
      pinned: true,
      title: Text(
        widget.title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }

  SliverAppBar _buildMediumTitleAppBar() {
    return SliverAppBar(
      actions: widget.actions,
      collapsedHeight: _expandedHeight,
      expandedHeight: _expandedHeight,
      floating: true,
      pinned: false,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: false,
        //expandedTitleScale: 1.5,
        title: Text(
          widget.title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        titlePadding: const EdgeInsets.only(left: 16),
      ),
    );
  }

  SliverAppBar _buildLargeTitleAppBar() {
    return SliverAppBar(
      actions: widget.animateActions
          ? widget.actions
              ?.map(
                (e) => AnimatedOpacity(
                  opacity: _titleOpacity,
                  duration: const Duration(milliseconds: 100),
                  child: e,
                ),
              )
              .toList()
          : widget.actions,
      expandedHeight: _expandedHeight,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: false,
        expandedTitleScale: 2,
        title: AnimatedOpacity(
          opacity: _flexibleSpaceOpacity,
          duration: const Duration(milliseconds: 100),
          child: Text(
            widget.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        // The [titlePadding] is following M3 Medium top app bar padding
        // https://m3.material.io/components/top-app-bar/specs#3f23d082-0dd6-4358-a6c9-2c6d72f1cd7a
        titlePadding: const EdgeInsets.only(left: 16),
      ),
      pinned: true,
      title: AnimatedOpacity(
        opacity: _titleOpacity,
        duration: const Duration(milliseconds: 100),
        child: Text(
          widget.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
