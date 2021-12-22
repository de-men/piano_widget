import 'package:flutter/widgets.dart';

import 'octave_widget.dart';

const octave = [
  'C',
  'C#',
  'D',
  'D#',
  'E',
  'F',
  'F#',
  'G',
  'G#',
  'A',
  'A#',
  'B',
];

extension ListExt<T> on List<T> {
  /// Maps each element and its index to a new value.
  Iterable<R> mapIndexed<R>(R Function(int index, T element) convert) sync* {
    for (var index = 0; index < length; index++) {
      yield convert(index, this[index]);
    }
  }
}

class PianoWidget extends StatelessWidget {
  final double height;
  final List<Iterable<MapEntry<String, int>>> octaves;
  final int whiteCount;

  /// The layout with 32 keys and start with C
  factory PianoWidget.keys32c({double height = 56}) {
    return PianoWidget.custom(keys: 32, startWith: 'C', height: height);
  }

  /// The layout with 32 keys and start with F
  factory PianoWidget.keys32f({double height = 56}) {
    return PianoWidget.custom(keys: 32, startWith: 'F', height: height);
  }

  /// The layout with 36 keys and start with C
  factory PianoWidget.keys36c({double height = 56}) {
    return PianoWidget.custom(keys: 36, startWith: 'C', height: height);
  }

  /// The layout with 36 keys and start with F
  factory PianoWidget.keys36f({double height = 56}) {
    return PianoWidget.custom(keys: 36, startWith: 'F', height: height);
  }

  /// The layout with 37 keys and start with C
  factory PianoWidget.keys37c({double height = 56}) {
    return PianoWidget.custom(keys: 37, startWith: 'C', height: height);
  }

  /// The layout with 37 keys and start with F
  factory PianoWidget.keys37f({double height = 56}) {
    return PianoWidget.custom(keys: 37, startWith: 'F', height: height);
  }

  /// The layout with 49 keys
  factory PianoWidget.keys49({double height = 56}) {
    return PianoWidget.custom(keys: 49, startWith: 'C', height: height);
  }

  /// The layout with 54 keys
  factory PianoWidget.keys54({double height = 56}) {
    return PianoWidget.custom(keys: 54, startWith: 'C', height: height);
  }

  /// The layout with 61 keys
  factory PianoWidget.keys61({double height = 56}) =>
      PianoWidget.custom(keys: 61, startWith: 'C', height: height);

  /// The layout with 76 keys
  factory PianoWidget.keys76({double height = 56}) {
    return PianoWidget.custom(keys: 76, startWith: 'E', height: height);
  }

  /// The layout with 88 keys
  factory PianoWidget.keys88({double height = 56}) {
    return PianoWidget.custom(keys: 88, startWith: 'A', height: height);
  }

  factory PianoWidget.custom({
    required int keys,
    required String startWith,
    double height = 56,
  }) {
    final startIndex = octave.indexOf(startWith);
    final firstOctave = startIndex == 0 ? 0 : 12 - startIndex;
    final fullOctaves = (keys - firstOctave) ~/ 12;
    final lastOctave = keys - firstOctave - fullOctaves * 12;
    var whiteCount = fullOctaves * 7;
    if (firstOctave > 0) {
      whiteCount += octave
          .sublist(startIndex, 12)
          .where((element) => !element.contains('#'))
          .length;
    }
    if (lastOctave > 0) {
      whiteCount += octave
          .sublist(0, lastOctave)
          .where((element) => !element.contains('#'))
          .length;
    }
    return PianoWidget._(
      octaves: [
        if (startIndex > 0) // First octave
          octave
              .sublist(startIndex, 12)
              .mapIndexed((index, element) => MapEntry(element, index)),
        for (var i = 0; i < fullOctaves; i++)
          octave.mapIndexed((index, element) {
            return MapEntry(element, firstOctave + i * 12 + index);
          }),
        if (lastOctave > 0)
          octave.sublist(0, lastOctave).mapIndexed(
              (index, element) => MapEntry(element, keys - 1 - index)),
      ],
      whiteCount: whiteCount,
      height: height,
    );
  }

  const PianoWidget._({
    Key? key,
    required this.octaves,
    required this.whiteCount,
    this.height = 56,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final width = constraints.maxWidth;
          final whiteNoteWidth =
              (width - divider * (whiteCount - 1)) / whiteCount;
          return Row(
            children: [
              for (final widgets in octaves.mapIndexed((index, element) => [
                    OctaveWidget(
                      whiteKeyWidth: whiteNoteWidth,
                      height: height,
                      pitches: element.toList(),
                    ),
                    if (index < octaves.length - 1)
                      const SizedBox(width: divider),
                  ]))
                ...widgets,
            ],
          );
        },
      ),
    );
  }
}
