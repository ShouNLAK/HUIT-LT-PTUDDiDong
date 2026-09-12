import 'package:b5_nguyen_le_anh_khoa/BTHD_3/GirdItem.dart';
import 'package:flutter/material.dart';

class BTHD_3 extends StatefulWidget {
  const BTHD_3({super.key});
  @override
  State<BTHD_3> createState() => _MyGirdViewState();
}

class _MyGirdViewState extends State<BTHD_3> {
  List<GirdItem> lst = [
    GirdItem(title: 'Login', icon: Icons.login),
    GirdItem(title: 'Search', icon: Icons.search),
    GirdItem(title: 'Profile', icon: Icons.person),
    GirdItem(title: 'Setting', icon: Icons.settings),
    GirdItem(title: 'Cart', icon: Icons.shopping_cart),
    GirdItem(title: 'Payment', icon: Icons.payment),
    GirdItem(title: 'Task', icon: Icons.add_task),
    GirdItem(title: 'Alert', icon: Icons.add_alert),
    GirdItem(title: 'Bank', icon: Icons.account_balance),
    GirdItem(title: 'Walet', icon: Icons.account_balance_wallet),
    GirdItem(title: 'Email', icon: Icons.mail),
    GirdItem(title: 'More', icon: Icons.arrow_circle_right_outlined),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GridView Demo"),
        backgroundColor: Colors.orangeAccent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          }, 
        icon: const Icon(Icons.home)
        ),
      ),
      body: GridView.builder(
        itemCount: lst.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 2,
          mainAxisSpacing: 2,
        ),
        itemBuilder: (context, index) {
          return Card(
            child: Container(
              color: Colors.blue,
              child: Center(
                child: Column(
                  children: [
                    Icon(lst[index].icon, size: 50),
                    Text(lst[index].title, style: TextStyle(fontSize: 20)),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
