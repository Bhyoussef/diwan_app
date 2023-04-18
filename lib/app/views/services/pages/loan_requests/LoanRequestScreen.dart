import 'package:diwanapp/app/constants/constants.dart';
import 'package:diwanapp/app/views/home/drawer/homeDrawer.dart';
import 'package:flutter/material.dart';

class LoanRequestScreen extends StatelessWidget {
  const LoanRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const HomeDrawer(index: servicesIndex),
      body: Container(
        child: const Text('test'),
      ),
    );
  }
}
