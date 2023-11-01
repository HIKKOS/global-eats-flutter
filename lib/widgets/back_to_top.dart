import 'dart:io';
import 'dart:math' show pi;
import 'package:flutter/material.dart';
import '/utils/utils.dart';

class BackToTop extends StatefulWidget {
  /// Crea un widget que muestra un [IconButton] que
  /// al ser presionado devuelve el [ScrollController] al inicio.
  const BackToTop(
      {super.key, required this.child, this.physics, this.position});
  final double? position;
  final Widget child;

  final ScrollPhysics? physics;

  @override
  State<BackToTop> createState() => _BackToTopState();
}

class _BackToTopState extends State<BackToTop> {
  late ScrollController scrollController;
  late bool showArrowButton = false;
  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    scrollController.addListener(() {
      showArrowButton = (scrollController.position.pixels > 130);
      setState(() {});
    });
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Stack(children: [
        SizedBox(
          child: ScrollConfiguration(
            behavior: MyScrollBehavior().copyWith(overscroll: false),
            child: SingleChildScrollView(
              controller: scrollController,
              child: widget.child,
            ),
          ),
        ),
        if (showArrowButton)
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: _UpIcon(onTap: () async {
                  scrollController.animateTo(
                      scrollController.position.minScrollExtent -
                          (scrollController.position.pixels / 14),
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut);
                })),
          ),
      ]),
    );
  }
}

class _UpIcon extends StatelessWidget {
  const _UpIcon({
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: onTap,
        icon: Transform.rotate(
          origin: const Offset(0, 0),
          angle: pi / 2,
          child: Icon(
            Platform.isAndroid
                ? Icons.arrow_back_rounded
                : Icons.arrow_back_ios_rounded,
            color: Colors.white,
            size: 30,
          ),
        ));
  }
}
