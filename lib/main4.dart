import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// 多选支持选中和取消选中
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
  Set<int> selectedIndexList = <int>{};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Test')),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final isSelected = selectedIndexList.contains(index);
          return ListTile(
            selected: isSelected,
            selectedTileColor: Colors.red.withAlpha(77),
            title: Text('这是列表$index'),
            onTap: () {
              setState(() {
                if (isSelected) {
                  selectedIndexList.remove(index);
                } else {
                  selectedIndexList.add(index);
                }
              });
            },
          );
        },
        itemCount: 100,
      ),
    );
  }
}
