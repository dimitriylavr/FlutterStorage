import 'dart:async';

import 'package:flutter/material.dart';

void main() => runApp(const TrainApp());

class TrainApp extends StatefulWidget {
  const TrainApp({Key? key}) : super(key: key);

  @override
  _TrainAppState createState() => _TrainAppState();
}

class _TrainAppState extends State<TrainApp> {
  late bool _loading;
  late double _progressValue;

  @override
  void initState() {
    _loading = false;
    _progressValue = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.amber,
        appBar: AppBar(
          title: const Text(
            "Training App",
          ),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: Center(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: _loading
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      LinearProgressIndicator(
                        value: _progressValue,
                      ),
                      Text(
                        '${(_progressValue * 100).round()}%',
                        style:
                            const TextStyle(color: Colors.black, fontSize: 30),
                      ),
                    ],
                  )
                : const Text(
                    "Нажми кнопку для скачивания",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _loading = !_loading;
              _updateProgress();
            });
          },
          child: const Icon(Icons.cloud_download),
        ),
      ),
    );
  }

  void _updateProgress() {
    const oneSec = Duration(seconds: 1);
    Timer.periodic(oneSec, (Timer t) {
      setState(() {
        _progressValue += 0.2;
        if (_progressValue.toStringAsFixed(1) == '1.0') {
          _loading = false;
          t.cancel();
          _progressValue = 0;
          return;
        }
      });
    });
  }
}
