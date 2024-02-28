import 'package:flutter/material.dart';
import 'package:test_ws/presentation/style/font.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Text('Home',style: FontStyle.home,)),
          ],
        ),
      ),
    );
  }
}
