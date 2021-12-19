<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

A Flutter package provide a widget that show piano keyboard layout.

## Getting started

We support some default piano keyboard layout as well as custom layout

![](https://raw.githubusercontent.com/de-men/piano_widget/main/readme_images/example.gif)

## Usage

Please take a look at the (example)[https://github.com/de-men/piano_widget/example]

The widget support factories as some default (piano keyboard layout)[http://www.piano-keyboard-guide.com/piano-keyboard-layout.html]

```dart
ListView(
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
)
```

## Additional information

Feel free to give feedbacks
