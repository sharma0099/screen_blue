import 'dart:js_interop';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyApp> {
  var numberController = TextEditingController();
  var color = 1;
  var number = 1;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text("WRAP WIDGET")),
        ),
        body: Column(
          children: [
            Row(
              children: [
                OutlinedButton(
                  onPressed: () {
                    print('Red');
                    setState(() {
                      color = 1;
                    });
                  },
                  child: const Text("Red"),
                ),
                OutlinedButton(
                  onPressed: () {
                    print('Green');
                    setState(() {
                      color = 2;
                    });
                  },
                  child: const Text("Green"),
                ),
                OutlinedButton(
                  onPressed: () {
                    print('Blue');
                    setState(() {
                      color = 3;
                    });
                  },
                  child: const Text("Blue"),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    width: 100,
                    height: 50,
                    child: TextField(
                      controller: numberController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (numberController.text.isEmpty) {
                      //toast
                      return;
                    }
                    number = int.parse(numberController.text.toString());
                    setState(() {});
                  },
                  child: Text("Apply"),
                )
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Wrap(
                  spacing: 10,
                  runSpacing: 20,
                  direction: Axis.horizontal,
                  children: getWrapWidget(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  List<Widget> getWrapWidget() {
    var List = <Widget>[];
    for (int i = 0; i < number; i++) {
      List.add(Container(
        height: 100,
        width: 100,
        margin: EdgeInsets.symmetric(),
        color: color == 1
            ? Colors.red
            : color == 2
                ? Colors.green
                : Colors.blue,
      ));
    }
    return List;
  }
}
