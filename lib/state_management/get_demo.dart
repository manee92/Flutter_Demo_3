import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(MaterialApp(home: Home()));

class Controller extends GetxController {
  var count = 0.obs;
  increment() {
    count++;
  }
}

class Home extends StatelessWidget {
  final controller = Get.put(Controller());

  Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Counter")),
      body: Center(
        child: Obx(() => Text(
              "${controller.count}",
              style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            )),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: controller.increment,
      ),
    );
  }
}
