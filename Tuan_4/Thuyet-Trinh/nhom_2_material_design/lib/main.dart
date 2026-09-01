import 'package:flutter/material.dart';
import 'package:nhom_2_material_design/screens/container_demo.dart';
import 'package:nhom_2_material_design/screens/stack_demo.dart';
import 'package:nhom_2_material_design/screens/dialog_demo.dart';
import 'package:nhom_2_material_design/screens/date_picker_demo.dart';
import 'package:nhom_2_material_design/screens/time_picker_demo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material Design Widgets Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const MenuScreen(),
    );
  }
}

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Thuyết trình Nhóm 2 - Demo Widgets',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildMenuButton(context, 'Container Demo', const ContainerDemo()),
              const SizedBox(height: 15),
              _buildMenuButton(context, 'Stack Demo', const StackDemo()),
              const SizedBox(height: 15),
              _buildMenuButton(context, 'Dialogs Demo', const DialogDemo()),
              const SizedBox(height: 15),
              _buildMenuButton(context, 'Date Picker Demo', const DatePickerDemo()),
              const SizedBox(height: 15),
              _buildMenuButton(context, 'Time Picker Demo', const TimePickerDemo()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuButton(BuildContext context, String title, Widget page) {
    return SizedBox(
      width: 250,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.teal,
          foregroundColor: Colors.white,
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
        },
        child: Text(title),
      ),
    );
  }
}
