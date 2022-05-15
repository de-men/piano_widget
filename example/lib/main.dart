import 'package:flutter/material.dart';
import 'package:piano_widget/piano_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text('Piano'),
      ),
      backgroundColor: Colors.grey,
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const Text('32 Keys start with C, custom clickable key widget'),
            PianoWidget.keys32c(keyBuilder: buildKey),
            const Divider(),
            const Text('32 Keys start with F, wrapper by stateful widget'),
            const MyStatefulWidget(),
            const Divider(),
            const Text('36 Keys start with C'),
            PianoWidget.keys36c(),
            const Divider(),
            const Text('36 Keys start with F'),
            PianoWidget.keys36f(),
            const Divider(),
            const Text('37 Keys start with C'),
            PianoWidget.keys37c(),
            const Divider(),
            const Text('37 Keys start with F'),
            PianoWidget.keys37f(),
            const Divider(),
            const Text('49 Keys'),
            PianoWidget.keys49(),
            const Divider(),
            const Text('54 Keys'),
            PianoWidget.keys54(),
            const Divider(),
            const Text('61 Keys'),
            PianoWidget.keys61(),
            const Divider(),
            const Text('76 Keys'),
            PianoWidget.keys76(),
            const Divider(),
            const Text('88 Keys'),
            PianoWidget.keys88(),
          ],
        ),
      ),
    );
  }

  Widget buildKey(double width, double height, MapEntry<String, int> pitch) {
    return MyKeyWidget(width: width, height: height, pitch: pitch);
  }
}

class MyKeyWidget extends StatefulWidget {
  final double width;
  final double height;
  final MapEntry<String, int> pitch;

  const MyKeyWidget({
    required this.width,
    required this.height,
    required this.pitch,
    Key? key,
  }) : super(key: key);

  @override
  State<MyKeyWidget> createState() => _MyKeyWidgetState();
}

class _MyKeyWidgetState extends State<MyKeyWidget> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          isPressed = true;
        });
      },
      onTapUp: (_) {
        setState(() {
          isPressed = false;
        });
      },
      onTapCancel: () {
        setState(() {
          isPressed = false;
        });
      },
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          color: isPressed
              ? Colors.red
              : (widget.pitch.key.contains('#') ? Colors.black : Colors.white),
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(2),
            bottomRight: Radius.circular(2),
          ),
        ),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  var _pressedNotes = <String>{};

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PianoWidget.keys32f(
          keyBuilder: (width, height, pitch) {
            return Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                color: _pressedNotes
                        .contains('${pitch.key}${pitch.value ~/ 12 + 1}')
                    ? Colors.red
                    : (pitch.key.contains('#') ? Colors.black : Colors.white),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(2),
                  bottomRight: Radius.circular(2),
                ),
              ),
            );
          },
        ),
        Row(
          children: [
            _buildButton('B2'),
            _buildButton('B3'),
            _buildButton('F#1'),
          ],
        )
      ],
    );
  }

  Widget _buildButton(String note) {
    return GestureDetector(
      onTapDown: (_) {
        _pressedNotes.add(note);
        setState(() {
          _pressedNotes = Set.of(_pressedNotes);
        });
      },
      onTapUp: (_) {
        _pressedNotes.remove(note);
        setState(() {
          _pressedNotes = Set.of(_pressedNotes);
        });
      },
      onTapCancel: () {
        _pressedNotes.remove(note);
        setState(() {
          _pressedNotes = Set.of(_pressedNotes);
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(note),
      ),
    );
  }
}
