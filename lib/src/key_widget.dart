import 'package:flutter/material.dart';

class KeyWidget extends StatelessWidget {
  final double width;
  final double height;
  final MapEntry<String, int> pitch;

  const KeyWidget({
    required this.width,
    required this.height,
    required this.pitch,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: (pitch.key.contains('#') ? Colors.black : Colors.white),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(2),
          bottomRight: Radius.circular(2),
        ),
      ),
    );
  }
}

typedef KeyBuilder = Widget Function(
  double width,
  double height,
  MapEntry<String, int> pitch,
);
