import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Test')),
      body: GridView.count(
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        scrollDirection: .horizontal,
        padding: const EdgeInsets.all(10),
        children: List.generate(100, (index) {
          return Container(
            alignment: .center,
            color: Colors.green,
            child: Text('这是第${index + 1}个列表'),
          );
        }),
      ),
    );
  }
}
