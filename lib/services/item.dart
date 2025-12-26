import '../models/item.dart';

Future<List<Item>> fetchItem({bool shouldFail = false}) async {
  await Future.delayed(const Duration(seconds: 2));
  if (shouldFail) {
    throw Exception('加载失败');
  }
  return List.generate(20, (i) => Item(id: i + 1, title: '这是列表$i'));
}
