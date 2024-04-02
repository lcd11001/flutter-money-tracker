import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          Text('Welcome to Money Tracker!'),
        ],
      ),
    );
  }
}
