import 'package:flutter/widgets.dart';

import 'key_widget.dart';

const divider = 0.5;

class OctaveWidget extends StatelessWidget {
  final double whiteKeyWidth;
  final double height;
  final List<MapEntry<String, int>> pitches;

  const OctaveWidget({
    Key? key,
    required this.whiteKeyWidth,
    required this.height,
    required this.pitches,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final count = pitches.length;
    final whites = pitches.where((e) => !e.key.contains('#')).toList();
    final whiteCount = whites.length;
    final width = whiteCount * whiteKeyWidth + (whiteCount - 1) * divider;
    return SizedBox(
      width: width,
      height: height,
      child: Stack(
        children: [
          for (var i = 0; i < count; i++) ...[
            if (!pitches[i].key.contains('#'))
              Builder(builder: (context) {
                final index = whites.indexOf(pitches[i]);
                return Positioned.fromRect(
                  rect: Rect.fromLTWH(
                    index * (whiteKeyWidth + divider),
                    0,
                    whiteKeyWidth,
                    height,
                  ),
                  child: KeyWidget(
                    width: whiteKeyWidth,
                    height: height,
                    pitch: whites[index],
                  ),
                );
              }),
            if (!pitches[i].key.contains('#') &&
                i > 0 &&
                pitches[i - 1].key.contains('#'))
              Builder(builder: (context) {
                final index = whites.indexOf(pitches[i]);
                return Positioned.fromRect(
                  rect: Rect.fromCenter(
                    center:
                        Offset(index * (whiteKeyWidth + divider), height / 3),
                    width: whiteKeyWidth * 2 / 3,
                    height: height * 2 / 3,
                  ),
                  child: KeyWidget(
                    width: whiteKeyWidth,
                    height: height,
                    pitch: pitches[i - 1],
                  ),
                );
              })
          ]
        ],
      ),
    );
  }
}
