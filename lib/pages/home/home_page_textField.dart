import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('登录')),
      body: Container(
        padding: const EdgeInsets.all(24),
        color: Colors.white,
        child: Column(
          children: [
            TextField(
              controller: _usernameController,
              onChanged: (value) {
                print(value);
              },
              onSubmitted: (value) {
                print(value);
              },
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(left: 16),
                hintText: '请输入账号',
                fillColor: const Color.fromARGB(255, 222, 219, 207),
                filled: true,
                border: OutlineInputBorder(
                  borderSide: .none,
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _passwordController,
              obscureText: true, //不显示实际内容用来做密码框
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(left: 16),
                hintText: '请输入密码',
                fillColor: const Color.fromARGB(255, 222, 219, 207),
                filled: true,
                border: OutlineInputBorder(
                  borderSide: .none,
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              height: 50,
              width: .infinity,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(25),
              ),
              child: TextButton(
                onPressed: () {
                  print('登录-${_passwordController.text}');
                },
                child: const Text('登录', style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
