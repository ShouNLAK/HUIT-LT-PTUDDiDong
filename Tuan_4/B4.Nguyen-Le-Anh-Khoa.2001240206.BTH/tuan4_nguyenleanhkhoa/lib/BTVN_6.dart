import 'package:flutter/material.dart';

class BTVN_6 extends StatelessWidget {
  const BTVN_6({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildNeumorphicButton(
                    Icons.arrow_back, 
                    size: 50,
                  ),
                  const Text(
                    "P L A Y L I S T", 
                    style: TextStyle(
                      fontWeight: FontWeight.bold, 
                      fontSize: 16, 
                      color: Colors.black54, 
                      letterSpacing: 2,
                    ),
                  ),
                  _buildNeumorphicButton(
                    Icons.menu, 
                    size: 50,
                  ),
                ],
              ),
              const SizedBox(height: 32),
              Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black38, 
                      offset: Offset(5, 5), 
                      blurRadius: 15, 
                      spreadRadius: 1,
                    ),
                    BoxShadow(
                      color: Colors.white, 
                      offset: Offset(-5, -5), 
                      blurRadius: 15, 
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    'img/cover.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Adele", 
                        style: TextStyle(
                          fontSize: 16, 
                          color: Colors.black54,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Skyfall", 
                        style: TextStyle(
                          fontSize: 28, 
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const Icon(
                    Icons.favorite, 
                    color: Colors.red, 
                    size: 32,
                  ),
                ],
              ),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Text(
                    "0:00", 
                    style: TextStyle(
                      color: Colors.black54, 
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(
                    Icons.shuffle, 
                    color: Colors.black54,
                  ),
                  Icon(
                    Icons.repeat, 
                    color: Colors.black54,
                  ),
                  Text(
                    "4:22", 
                    style: TextStyle(
                      color: Colors.black54, 
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Container(
                height: 8,
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 150,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    )
                  ],
                ),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildNeumorphicButton(
                    Icons.fast_rewind, 
                    size: 70,
                  ),
                  _buildNeumorphicButton(
                    Icons.play_arrow, 
                    size: 70,
                  ),
                  _buildNeumorphicButton(
                    Icons.fast_forward, 
                    size: 70,
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNeumorphicButton(IconData icon, {required double size}) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.black38, 
            offset: Offset(4, 4), 
            blurRadius: 8, 
            spreadRadius: 1,
          ),
          BoxShadow(
            color: Colors.white, 
            offset: Offset(-4, -4), 
            blurRadius: 8, 
            spreadRadius: 1,
          ),
        ],
      ),
      child: Icon(
        icon, 
        color: Colors.black54,
      ),
    );
  }
}
