import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Theme change using Get',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
          primaryColor: const Color(0xff3bbf46),
          scaffoldBackgroundColor: Colors.white),
      darkTheme: ThemeData.dark().copyWith(
          primaryColor: const Color(0xfffa757c),
          scaffoldBackgroundColor: Colors.black),
      themeMode: ThemeMode.system,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final controller = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Theme.of(context).primaryColor),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: Text(
                "Change Theme",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            addRadioButton(
                title: "System",
                val: ThemeMode.system,
                context: context,
                icon: Icons.system_security_update_good),
            addRadioButton(
              title: "Light",
              val: ThemeMode.light,
              icon: Icons.dark_mode,
              context: context,
            ),
            addRadioButton(
              title: "Dark",
              val: ThemeMode.dark,
              icon: Icons.light_mode_outlined,
              context: context,
            ),
          ],
        ),
      ),
    );
  }

  GetBuilder addRadioButton(
      {required ThemeMode val,
      required String title,
      required IconData icon,
      required BuildContext context}) {
    return GetBuilder<ThemeController>(
      builder: (_) => RadioListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title),
            Icon(icon),
          ],
        ),
        value: val,
        activeColor: Theme.of(context).primaryColor,
        groupValue: controller.themeMode,
        onChanged: (ThemeMode? value) {
          controller.setThemeMode(value!);
        },
      ),
    );
  }
}

class ThemeController extends GetxController {
  static ThemeController get to => Get.find();

  @override
  void onInit() {
    super.onInit();
    getSavedThemeMode();
  }

  GetStorage box = GetStorage();

  ThemeMode themeMode = ThemeMode.system;

  Future<void> setThemeMode(ThemeMode theme) async {
    Get.changeThemeMode(theme);
    themeMode = theme;
    box.write("theme", themeMode.toString().split('.')[1]);
    update();
  }

  getSavedThemeMode() async {
    var savedTheme = box.read("theme") ?? "system";
    themeMode =
        ThemeMode.values.firstWhere((e) => describeEnum(e) == savedTheme);
    Get.changeThemeMode(themeMode);
    update();
  }
}
