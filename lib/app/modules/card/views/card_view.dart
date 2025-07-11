import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/card_controller.dart';

class CardView extends GetView<CardController> {
  const CardView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CardView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'CardView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
