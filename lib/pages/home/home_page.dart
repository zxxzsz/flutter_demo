import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../view_models/item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _didInit = false;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_didInit) {
      _didInit = true;
      Future.microtask(() {
        if (!mounted) return;
        Provider.of<ItemViewModel>(context, listen: false).loadItems();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<ItemViewModel>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Test')),
      body: AnimatedBuilder(
        animation: viewModel,
        builder: (context, _) {
          if (viewModel.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (viewModel.error != null) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('加载失败: ${viewModel.error}'),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => viewModel.loadItems(),
                    child: const Text('重试'),
                  ),
                ],
              ),
            );
          }

          return RefreshIndicator(
            onRefresh: () => viewModel.loadItems(),
            child: ListView.builder(
              itemCount: viewModel.items.length,
              itemBuilder: (context, index) {
                final item = viewModel.items[index];
                final isSelected = viewModel.selectedId == item.id;
                return ListTile(
                  selected: isSelected,
                  selectedTileColor: Colors.red.withAlpha(55),
                  title: Text(item.title),
                  onTap: () {
                    viewModel.setSelectedId(id: isSelected ? null : item.id);
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
