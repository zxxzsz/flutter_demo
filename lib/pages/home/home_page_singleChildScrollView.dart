import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Test')),
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            padding: const EdgeInsets.all(20),
            child: Column(
              children: List.generate(100, (index) {
                return Container(
                  margin: const EdgeInsets.only(top: 10),
                  width: .infinity,
                  height: 100,
                  alignment: .center,
                  color: Colors.green,
                  child: Text(
                    '我是第${index + 1}个列表',
                    style: const TextStyle(color: Colors.white),
                  ),
                );
              }),
            ),
          ),
          Positioned(
            right: 10,
            top: 10,
            child: GestureDetector(
              onTap: () {
                _scrollController.animateTo(
                  _scrollController.position.maxScrollExtent,
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeIn,
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(40),
                ),
                width: 80,
                height: 80,
                alignment: .center,
                child: const Text('去底部', style: TextStyle(color: Colors.white)),
              ),
            ),
          ),
          Positioned(
            right: 10,
            bottom: 10,
            child: GestureDetector(
              onTap: () {
                // jumpTo:没有动画直接跳转
                _scrollController.animateTo(
                  0,
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeIn,
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(40),
                ),
                width: 80,
                height: 80,
                alignment: .center,
                child: const Text('去顶部', style: TextStyle(color: Colors.white)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
