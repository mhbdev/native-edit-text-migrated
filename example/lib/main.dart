import 'package:flutter/material.dart';
import 'package:native_edit_text_migrated/edit_text.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  EditTextController? _controller;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Builder(
          builder: (context) => Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  decoration: BoxDecoration(border: Border.all(color: Colors.red)),
                  child: NativeEditTextMigrated(
                    onEditTextCreated: (controller) {
                      setState(() {
                        _controller = controller;
                      });
                    },
                  ),
                ),
                FutureBuilder(
                  future: _controller?.getText(),
                  builder: (context, snapshot) =>
                      Text(snapshot.hasData ? snapshot.data.toString() : 'Loading...'),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_controller != null) _controller!.text = 'TESTING';
                  },
                  child: const Text('TEST'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
