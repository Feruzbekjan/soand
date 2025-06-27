import 'package:flutter/material.dart';
import 'package:soand/core/extension/extension.dart';

class GlobalScreen extends StatefulWidget {
  const GlobalScreen({super.key});

  @override
  State<GlobalScreen> createState() => _GlobalScreenState();
}

class _GlobalScreenState extends State<GlobalScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("GlobalScreen", style: context.style.fontSize16Weight700),
      ),
    );
  }
}
