import 'package:flutter/material.dart';
import 'package:soand/core/extension/extension.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("ProfileScreen", style: context.style.fontSize16Weight700),
      ),
    );
  }
}
