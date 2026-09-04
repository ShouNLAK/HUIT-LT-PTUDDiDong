import 'package:flutter/material.dart';

class BTTL_1 extends StatelessWidget {
  const BTTL_1({super.key});

  Widget taoNut(String ten) {
  return Expanded( 
    child: Container(
      width: 100,
      height: 80,
      margin: EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Colors.blueGrey,
      ),
      child: Center(
        child: Text(
          ten,
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            ),
          ),
        ),
      )
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Standard",
            style: TextStyle(fontWeight: FontWeight.bold)),
        leading: Builder(
          builder: (context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              }, 
              icon: const Icon(Icons.list)
            );
          }
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            }, 
            icon: const Icon(Icons.arrow_back)
          ),
          IconButton(
            onPressed: () {}, 
            icon: const Icon(Icons.history_rounded)
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: const Text(
              "0",
              style: TextStyle(
                fontSize: 60, 
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("MC", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
                Text("MR", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
                Text("M+", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                Text("M-", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                Text("MS", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                Text("Mv", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          Row(
            mainAxisAlignment:  MainAxisAlignment.center,
            children: [taoNut('1/x'), taoNut('x²'), taoNut('√x'), taoNut('÷'),],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [taoNut("%"), taoNut("CE"), taoNut("C"), taoNut("⌫")],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [taoNut("7"), taoNut("8"), taoNut("9"), taoNut("÷")],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [taoNut("4"), taoNut("5"), taoNut("6"), taoNut("×")],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [taoNut("1"), taoNut("2"), taoNut("3"), taoNut("−")],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [taoNut("0"), taoNut("."), taoNut("="), taoNut("+")],
          ),
        ],
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 40, left: 16, bottom: 8),
              child: Text("Calculator", style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            const ListTile(
              leading: Icon(Icons.calculate),
              title: Text("Standard"),
              dense: true,
            ),
            const ListTile(
              leading: Icon(Icons.science),
              title: Text("Scientific"),
              dense: true,
            ),
            const ListTile(
              leading: Icon(Icons.show_chart),
              title: Text("Graphing"),
              dense: true,
            ),
            const ListTile(
              leading: Icon(Icons.code),
              title: Text("Programmer"),
              dense: true,
            ),
            const ListTile(
              leading: Icon(Icons.calendar_today),
              title: Text("Date calculation"),
              dense: true,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 16, left: 16, bottom: 8),
              child: Text("Converter", style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            const ListTile(
              leading: Icon(Icons.currency_exchange),
              title: Text("Currency"),
              dense: true,
            ),
            const ListTile(
              leading: Icon(Icons.view_in_ar),
              title: Text("Volume"),
              dense: true,
            ),
            const ListTile(
              leading: Icon(Icons.straighten),
              title: Text("Length"),
              dense: true,
            ),
            const ListTile(
              leading: Icon(Icons.scale),
              title: Text("Weight and mass"),
              dense: true,
            ),
          ],
        ),
      ),
    );
  }
}