import 'package:flutter/material.dart';

// listView
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

// separated
class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Test')),
      body: ListView.separated(
        itemBuilder: (context, index) {
          return Container(
            // margin: const EdgeInsets.only(top: 10),
            color: Colors.green,
            width: .infinity,
            height: 80,
            alignment: .center,
            child: Text(
              '这是第${index + 1}个元素',
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
          );
        },
        itemCount: 100,
        separatorBuilder: (context, index) {
          return Container(color: Colors.yellow, height: 10, width: .infinity);
        },
      ),
    );
  }
}

// build模式,优点：不会再初始化的时候将所有列表项都创建，会根据用户的滚动行为动态的创建和销毁列表项
// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Test')),
//       body: ListView.builder(
//         itemBuilder: (context, index) {
//           return Container(
//             margin: const EdgeInsets.only(top: 10),
//             color: Colors.green,
//             width: .infinity,
//             height: 80,
//             alignment: .center,
//             child: Text(
//               '这是第${index + 1}个元素',
//               style: const TextStyle(color: Colors.white, fontSize: 20),
//             ),
//           );
//         },
//         itemCount: 100,
//       ),
//     );
//   }
// }

// 默认构造函数，适用于数据有限的情况
// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Test')),
//       body: ListView(
//         padding: const EdgeInsets.all(20),
//         children: List.generate(100, (index) {
//           return Container(
//             margin: const EdgeInsets.only(top: 10),
//             color: Colors.green,
//             width: .infinity,
//             height: 80,
//             alignment: .center,
//             child: Text(
//               '这是第${index + 1}个元素',
//               style: const TextStyle(color: Colors.white, fontSize: 20),
//             ),
//           );
//         }),
//       ),
//     );
//   }
// }
