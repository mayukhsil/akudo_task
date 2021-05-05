import 'package:akudo_task/modules/splash/view/splash_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Akudo());
}

class Akudo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Akudo Task',
      home: SplashView(),
    );
  }
}
