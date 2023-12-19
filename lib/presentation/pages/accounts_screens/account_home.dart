import 'package:flutter/material.dart';

class AccountHome extends StatelessWidget {
  const AccountHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Horizontal ListView.builder'),
        ),
        body: Container(
          height: 100,
          width: 100,
          color: Colors.red,
        ));
  }
}
