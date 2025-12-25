import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class Item {
  final int id;
  final String title;
  const Item({required this.id, required this.title});
}

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
  int? selectedId;

  Future<List<Item>> fetchItems({bool shouldFail = false}) async {
    await Future.delayed(const Duration(seconds: 2)); // 模拟接口延迟
    if (shouldFail) {
      throw Exception('模拟加载失败');
    }
    return List.generate(20, (i) => Item(id: i + 1, title: '这是列表$i'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Demo')),
      body: FutureBuilder<List<Item>>(
        future: fetchItems(shouldFail: true),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('加载失败: ${snapshot.error}'));
          }

          final itemList = snapshot.data!;

          return ListView.builder(
            itemCount: itemList.length,
            itemBuilder: (context, index) {
              final item = itemList[index];
              final isSelected = selectedId == item.id;

              return ListTile(
                key: ValueKey(item.id),
                selected: isSelected,
                selectedTileColor: Colors.green.withAlpha(77),
                title: Text(item.title),
                onTap: () {
                  setState(() {
                    selectedId = isSelected ? null : item.id;
                  });
                },
              );
            },
          );
        },
      ),
    );
  }
}
