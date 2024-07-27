import 'dart:ui';

import 'package:flutter/material.dart';

/// JAKE YOU ARE HERE, ADD PERSISTENT HEADER TO THIS WIDGET TO ATTACH SEARCH BAR

/// Padding and heights came from M3 https://m3.material.io/components/top-app-bar/specs

class SliverAppBarBuilder extends StatefulWidget {
  const SliverAppBarBuilder({
    required this.title,
    required this.scrollController,
    this.bottom,
    super.key,
  }) : largeTitle = false;

  const SliverAppBarBuilder.largeTitle({
    required this.title,
    required this.scrollController,
    this.bottom,
    super.key,
  }) : largeTitle = true;

  final String title;
  final ScrollController scrollController;
  final bool largeTitle;
  final PreferredSizeWidget? bottom;

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
    if (widget.largeTitle) {
      // The [_expandedHeight] is following M3 Medium top app bar sizing
      // https://m3.material.io/components/top-app-bar/specs#3f23d082-0dd6-4358-a6c9-2c6d72f1cd7a
      _expandedHeight = 152;
      _flexibleSpaceOpacity = 1;
      _titleOpacity = 0;
      widget.scrollController.addListener(_scrollListener);
    }
  }

  void _scrollListener() {
    final offset = widget.scrollController.offset;

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
    if (widget.largeTitle) {
      widget.scrollController.removeListener(_scrollListener);
    }
    widget.scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.largeTitle
        ? _buildLargeTitleAppBar()
        : _buildSmallTitleAppBar();
  }

  SliverAppBar _buildLargeTitleAppBar() {
    return SliverAppBar(
      bottom: widget.bottom,
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
      bottom: widget.bottom,
      pinned: true,
      title: Text(widget.title),
    );
  }
}
