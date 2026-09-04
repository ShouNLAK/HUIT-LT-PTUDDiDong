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
          'Thuyết trình Nhóm 2 - Demo',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 250,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ContainerDemo()),
                    );
                  },
                  child: const Text("1. Container Demo"),
                ),
              ),
              const SizedBox(height: 15),
              SizedBox(
                width: 250,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const StackDemo()),
                    );
                  },
                  child: const Text("2. Stack Demo"),
                ),
              ),
              const SizedBox(height: 15),
              SizedBox(
                width: 250,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const DialogDemo()),
                    );
                  },
                  child: const Text("3. Dialogs Demo"),
                ),
              ),
              const SizedBox(height: 15),
              SizedBox(
                width: 250,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const DatePickerDemo()),
                    );
                  },
                  child: const Text("4. Date Picker Demo"),
                ),
              ),
              const SizedBox(height: 15),
              SizedBox(
                width: 250,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const TimePickerDemo()),
                    );
                  },
                  child: const Text("5. Time Picker Demo"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
