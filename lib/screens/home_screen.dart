import 'package:flutter/material.dart';

import '../theme.dart';
import '../widgets/image_list_view.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: Stack(
        children: [
          Positioned.fill(
            child: ShaderMask(
              blendMode: BlendMode.dstOut,
              shaderCallback: (rect) => LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.transparent,
                    Colors.black.withOpacity(.8),
                    Colors.black.withOpacity(.9),
                    Colors.black,
                  ],
                  stops: const [
                    0,
                    .62,
                    .67,
                    .85,
                    1
                  ]).createShader(rect),
              child: const SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 30),
                    ImageListView(startIndex: 1, duration: 25),
                    SizedBox(height: 10),
                    ImageListView(startIndex: 11, duration: 45),
                    SizedBox(height: 10),
                    ImageListView(startIndex: 21, duration: 65),
                    SizedBox(height: 10),
                    ImageListView(startIndex: 31, duration: 30),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 60,
            right: 24,
            left: 24,
            child: SizedBox(
              height: 170,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    "Act with NFTs",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "Check out this raffle for guys only! new coin minted show some love.",
                    style: TextStyle(color: subText, height: 1.2),
                  ),
                  const Spacer(),
                  Container(
                    height: 50,
                    width: 140,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(8)),
                    child: const Text(
                      "Discover",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
