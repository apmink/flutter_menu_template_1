//* @aprekt.dev
//* Complete code on github
//* link in bio

import 'package:flutter/material.dart';
import 'package:flutter_layout_template_1/constants/strings.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Strings.title,
      theme: ThemeData(
          primarySwatch: Colors.blue, accentColor: Colors.amber.shade800),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isListView = true;

  Widget switchView() {
    if (isListView) {
      return ListView.builder(itemBuilder: ((context, index) {
        return Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            Container(
              height: 56,
              width: 380,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 235, 80, 8),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                  child: Text(
                "Item no.${index + 1}",
                style: const TextStyle(color: Colors.white),
              )),
            ),
            const SizedBox(
              height: 15,
            ),
          ],
        );
        // ListTile(
        //   title: Text("Item #${index + 1}"),
        //   tileColor: Theme.of(context).accentColor,
        // contentPadding: EdgeInsets.all(20),
      }));
    }
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15.0,
      ),
      itemBuilder: (context, index) {
        return GridTile(
            child: Material(
          elevation: 10,
          borderRadius: const BorderRadius.all(Radius.circular(50)),
          child: Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Color.fromARGB(255, 154, 101, 28),
                    // Colors.red,
                    Color.fromARGB(255, 235, 80, 8),
                  ],
                )),
            padding: const EdgeInsets.all(8),
            child: Center(
              child: Text(
                "Item no.${index + 1}",
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
        ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 235, 80, 8),
        title: const Text(Strings.title),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isListView = true;
              });
            },
            icon: const Icon(Icons.view_list),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                isListView = false;
              });
            },
            icon: const Icon(Icons.view_module),
          ),
        ],
      ),
      body: Container(
          padding: const EdgeInsets.only(top: 15, left: 8, right: 8),
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color.fromARGB(255, 237, 159, 42),
              Color.fromARGB(255, 233, 139, 68),
            ],
          )),
          child: switchView()),
    );
  }
}
