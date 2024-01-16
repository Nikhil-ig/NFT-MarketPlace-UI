import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import '../screens/nft_screen.dart';

class ImageListView extends StatefulWidget {
  const ImageListView(
      {super.key, required this.startIndex, required this.duration});

  final int startIndex;
  final int duration;

  @override
  State<ImageListView> createState() => _ImageListViewState();
}

class _ImageListViewState extends State<ImageListView> {
  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();

    scrollController = ScrollController();

    scrollController.addListener(() {
      // Detect if is at the End of ListViwe
      if (scrollController.position.atEdge) {
        autoScroll();
      }
    });

    // Add this to make sure that controller has been attected to listViwe
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      autoScroll();
    });
  }

  autoScroll() {
    final currentScrollPosition = scrollController.offset;
    final scrollEndPosition = scrollController.position.maxScrollExtent;

    scheduleMicrotask(() {
      scrollController.animateTo(
          currentScrollPosition == scrollEndPosition ? 0 : scrollEndPosition,
          duration: Duration(seconds: widget.duration),
          curve: Curves.linear);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: 1.96 * pi,
      child: SizedBox(
        height: 130,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            controller: scrollController,
            itemCount: 10,
            itemBuilder: (context, index) => ImageTile(
                image: "assets/nfts/${widget.startIndex + index}.png")),
      ),
    );
  }
}

class ImageTile extends StatelessWidget {
  const ImageTile({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => NFTScreen(
            image: image,
          ),
        ),
      ),
      child: Hero(
        tag: image,
        child: Image.asset(
          image,
          width: 130,
        ),
      ),
    );
  }
}
