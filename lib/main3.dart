import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// 列表多选
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
  final Set<int> selectedIndexes = <int>{};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Test')),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final isSelected = selectedIndexes.contains(index);

          return ListTile(
            selected: isSelected,
            tileColor: Colors.white,
            selectedTileColor: Colors.red.withAlpha(51),
            title: Text('这是列表$index'),
            onTap: () {
              setState(() {
                if (isSelected) {
                  selectedIndexes.remove(index);
                } else {
                  selectedIndexes.add(index);
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
