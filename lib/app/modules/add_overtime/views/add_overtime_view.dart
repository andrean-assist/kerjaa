import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_overtime_controller.dart';

class AddOvertimeView extends GetView<AddOvertimeController> {
  const AddOvertimeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AddOvertimeView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AddOvertimeView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
