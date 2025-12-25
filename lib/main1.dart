import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// 单击按钮控制色块的显示或者隐藏
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool flag = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Test')),
      body: Column(
        children: [
          if (flag) Container(height: 40, width: 40, color: Colors.red),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              setState(() {
                flag = !flag;
              });
            },
            child: Text(flag ? '隐藏' : '显示'),
          ),
        ],
      ),
    );
  }
}
