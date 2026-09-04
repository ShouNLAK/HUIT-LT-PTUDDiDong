import 'package:flutter/material.dart';

class BTTL_2 extends StatefulWidget {
  const BTTL_2({super.key});

  @override
  State<BTTL_2> createState() => BTTL_2_State();
}

class BTTL_2_State extends State<BTTL_2> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildFacilityItem(IconData icon, String title, String address) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Icon(icon, color: Colors.cyan, size: 30),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        subtitle: Text(address, style: const TextStyle(fontSize: 15)),
      ),
    );
  }

  Widget _buildContactItem(IconData icon, String title, String detail) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        children: [
          Icon(icon, size: 28, color: Colors.orange),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                Text(detail, style: const TextStyle(fontSize: 16)),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Xây dựng danh sách 3 màn hình tương ứng
    final List<Widget> widgetOptions = <Widget>[
      // Màn hình 1: Thông tin
      SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              'img/huit_campus.jpg', 
              fit: BoxFit.cover, 
              width: double.infinity,
              height: 250,
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Đại học Công Thương TP.HCM (HUIT)", 
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.blue)
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Trường Đại học Công Thương Thành phố Hồ Chí Minh là cơ sở giáo dục đại học công lập đào tạo đa ngành, đa lĩnh vực, có thế mạnh về các nhóm ngành công nghệ, kỹ thuật, quản trị kinh doanh, và đặc biệt là công nghệ thực phẩm.", 
                    textAlign: TextAlign.justify, 
                    style: TextStyle(fontSize: 16, height: 1.5)
                  ),
                ],
              ),
            )
          ],
        ),
      ),

      // Màn hình 2: Cơ sở
      ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Text("Hệ thống Cơ sở của HUIT", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.blue)),
          const SizedBox(height: 16),
          _buildFacilityItem(Icons.location_on, "Cơ sở chính", "140 Lê Trọng Tấn, P. Tây Thạnh, Q. Tân Phú, TP.HCM"),
          _buildFacilityItem(Icons.business, "Cơ sở 2 (Khu G)", "73/1 Nguyễn Đỗ Cung, P. Tây Thạnh, Q. Tân Phú, TP.HCM"),
          _buildFacilityItem(Icons.apartment, "Cơ sở 3 (Khu H)", "31 Đường D9, P. Tây Thạnh, Q. Tân Phú, TP.HCM"),
          _buildFacilityItem(Icons.directions_run, "Trung tâm GDQP&AN", "Khu thể dục thể thao HUIT, Q. Tân Phú, TP.HCM"),
        ],
      ),

      // Màn hình 3: Liên lạc
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Thông tin liên hệ", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.blue)),
            const SizedBox(height: 20),
            _buildContactItem(Icons.phone, "Điện thoại", "(028) 3816 1673 - (028) 3816 3319"),
            _buildContactItem(Icons.email, "Email", "pdt@huit.edu.vn"),
            _buildContactItem(Icons.web, "Website", "https://huit.edu.vn/"),
            _buildContactItem(Icons.facebook, "Fanpage", "https://www.facebook.com/TuyensinhHUIT/"),
          ],
        ),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("HUIT", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.cyan,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Thông tin',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.apartment),
            label: 'Cơ sở',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_mail),
            label: 'Liên lạc',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.cyan[800],
        onTap: _onItemTapped,
      ),
    );
  }
}