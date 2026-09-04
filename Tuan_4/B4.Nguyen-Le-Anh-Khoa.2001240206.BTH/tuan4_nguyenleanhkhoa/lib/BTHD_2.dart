import 'package:flutter/material.dart';

class BTHD_2 extends StatelessWidget{
  const BTHD_2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stack Demo"),
        leading: IconButton(onPressed: () {}, 
        icon: const Icon(Icons.home)),
        backgroundColor: Colors.yellow,
        actions: [
          IconButton(onPressed: () {Navigator.pop(context);}, icon: const Icon(Icons.arrow_back))
        ],
        ),
      body:Stack(
        children: [
          Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            image: const DecorationImage(
              image: AssetImage('img/dong-phong-nha.jpg'),
              fit: BoxFit.cover
              )
            ),
          ),
          Positioned(
            right: 20,
            left: 20,
            bottom: 20,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20)
              ),
              height: 150,
              child: Column(
                children: [
                  SizedBox(height: 10),
                  Text("Động Phong Nha", 
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.red,
                    fontWeight: FontWeight.bold
                    )
                  ),
                  Padding(
                    padding: EdgeInsets.all(6),
                    child: Text("Động Phong Nha, nằm trong vườn quốc gia Phong Nha - Kẻ Bàng, tình Quảng Bình, Việt Nam. Là một trong những hang động nổi tiếng và hấp dẫn nhất thế giới", 
                    maxLines: 4,
                    textAlign: TextAlign.justify), 
                  )
                ],
              ),
            ), 
          )
        ],
      )
    );
  }
}