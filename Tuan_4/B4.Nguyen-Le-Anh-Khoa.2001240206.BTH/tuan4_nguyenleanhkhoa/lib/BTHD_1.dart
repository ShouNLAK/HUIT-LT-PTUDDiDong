import 'package:flutter/material.dart';

class BTHD_1 extends StatelessWidget{
  const BTHD_1({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        title: const Text("Layout Widget Demo"),
        actions: [
          IconButton(onPressed: () {
            Navigator.pop(context);
          }, 
          icon: const Icon(Icons.arrow_back))
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
            Row(
              children: [
                Container(
                  height: 175,
                  width: 175,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                const SizedBox(width: 16),
                Container(
                  height: 175,
                  width: 175,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
                height: 200,
                width: 350,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                  children: [
                  Container(
                      width: 175,
                      height: 300,
                      decoration: BoxDecoration(
                        color: Colors.cyan,
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  const SizedBox(width: 16),
                  Container(
                      width: 175,
                      height: 300,
                      decoration: BoxDecoration(
                        color: Colors.cyan,
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}