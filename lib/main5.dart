import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// 单列表支持选中和取消
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'Flutter App', home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Test')),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final isSelected = selectedIndex == index;
          return ListTile(
            selected: isSelected,
            selectedTileColor: Colors.green,
            title: Text('这是列表$index'),
            onTap: () {
              setState(() {
                selectedIndex = isSelected ? null : index;
              });
            },
          );
        },
        itemCount: 100,
      ),
    );
  }
}
