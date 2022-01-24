import 'package:duration_button/duration_button.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _skipIntro = 'Skip Intro';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Duraion Button Example',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Duration Button Example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              DurationButton(
                duration: const Duration(seconds: 3),
                onPressed: () {},
                child: const Text("Duration Button"),
              ),
              TextDurationButton(
                duration: const Duration(seconds: 7),
                text: const Text('Text Duraion Button'),
                onPressed: () {},
              ),
              IconDurationButton(
                Icons.favorite,
                iconColor: Colors.pink,
                onPressed: () {},
                duration: const Duration(seconds: 2),
              ),
              OutlinedDurationButton(
                child: Text(_skipIntro),
                onPressed: () {},
                onComplete: () => setState(() => _skipIntro = 'Intro Skipped'),
                duration: const Duration(seconds: 3),
              )
            ],
          ),
        ),
      ),
    );
  }
}
