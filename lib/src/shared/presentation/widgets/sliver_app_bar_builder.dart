import 'dart:ui';

import 'package:flutter/material.dart';

/// Padding and heights came from M3 specs:
/// https://m3.material.io/components/top-app-bar/specs
class SliverAppBarBuilder extends StatefulWidget {
  const SliverAppBarBuilder({
    required this.title,
    this.scrollController,
    this.actions,
    super.key,
  })  : isLargeTitle = false,
        animateActions = false;

  const SliverAppBarBuilder.largeTitle({
    required this.title,
    required ScrollController this.scrollController,
    this.animateActions = false,
    this.actions,
    super.key,
  }) : isLargeTitle = true;

  final String title;
  final bool isLargeTitle;

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

    if (widget.isLargeTitle) {
      // The [_expandedHeight] is following M3 Medium top app bar sizing
      // https://m3.material.io/components/top-app-bar/specs#3f23d082-0dd6-4358-a6c9-2c6d72f1cd7a
      _expandedHeight = 152;
      _flexibleSpaceOpacity = 1;
      _titleOpacity = 0;
      widget.scrollController?.addListener(_scrollListener);
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
    widget.scrollController?.removeListener(_scrollListener);
    widget.scrollController?.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.isLargeTitle
        ? _buildLargeTitleAppBar()
        : _buildSmallTitleAppBar();
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
      flexibleSpace: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
          child: FlexibleSpaceBar(
            centerTitle: false,
            expandedTitleScale: 2,
            title: AnimatedOpacity(
              opacity: _flexibleSpaceOpacity,
              duration: const Duration(milliseconds: 100),
              child: Text(widget.title),
            ),
            // The [titlePadding] is following M3 Medium top app bar padding
            // https://m3.material.io/components/top-app-bar/specs#3f23d082-0dd6-4358-a6c9-2c6d72f1cd7a
            titlePadding: const EdgeInsets.only(left: 16),
          ),
        ),
      ),
      pinned: true,
      title: AnimatedOpacity(
        opacity: _titleOpacity,
        duration: const Duration(milliseconds: 100),
        child: Text(widget.title),
      ),
    );
  }

  SliverAppBar _buildSmallTitleAppBar() {
    return SliverAppBar(
      actions: widget.actions,
      pinned: true,
      title: Text(widget.title),
    );
  }
}
