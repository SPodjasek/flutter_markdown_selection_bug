import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  final String sampleMd =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
      'Curabitur dignissim dignissim felis, quis vulputate purus bibendum eget. '
      'Proin consectetur nibh quis urna volutpat interdum. Curabitur ut justo ut '
      'lorem pellentesque finibus et sit amet dui. Praesent in arcu bibendum, '
      'aliquam erat vel, consectetur est. Donec aliquet bibendum mi ut euismod. '
      'Duis faucibus lorem a urna aliquam, faucibus congue mi ullamcorper. '
      'Integer sit amet hendrerit metus. In porta dui eget hendrerit hendrerit. '
      'Etiam in ultricies tellus, nec pharetra turpis.';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Flutter Markdown Selection Bug PoC'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: MarkdownBody(
          /// When [selectable] is true, and [onSelectionChanged] is not set
          /// the following error is thrown:
          ///   #0      MarkdownBuilder._buildRichText.<anonymous closure> (package:flutter_markdown/src/builder.dart:966:35)
          selectable: true,
          // onSelectionChanged: (text, selection, cause) {
          //   debugPrint("onSelectionChanged: $text, $selection, $cause");
          // },
          onTapLink: (text, href, title) {
            debugPrint("onTapLink: $text, $href, $title");
          },
          softLineBreak: true,
          shrinkWrap: true,
          data: sampleMd,
        ),
      ),
    );
  }
}
