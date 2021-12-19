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
            const Text('32 Keys start with C'),
            PianoWidget.keys32c(),
            const Divider(),
            const Text('32 Keys start with F'),
            PianoWidget.keys32f(),
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
}
