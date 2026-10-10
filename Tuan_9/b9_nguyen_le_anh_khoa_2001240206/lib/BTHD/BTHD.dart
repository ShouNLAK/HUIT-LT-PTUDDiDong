import 'package:b9_nguyen_le_anh_khoa_2001240206/BTHD/NotificationService.dart';
import 'package:flutter/material.dart';

class ScreenNotiEx extends StatelessWidget{
  const ScreenNotiEx({super.key});

  @override
  Widget build(BuildContext context) {
    NotificationService notificationService = NotificationService();
    notificationService.init();
    return Scaffold(
      appBar: AppBar(title: Text("Screen Notification Example")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () { notificationService.showSimpleNotification(0, "learn_english_channel", "Học anh văn", "Nhắc học từ vựng" , "Bạn đã học 5 từ mới hôm nay chưa ?"); }, 
            child: Text("Gửi thông báo nhắc học Ngoại Ngữ"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () { notificationService.scheduleNotificationAfter(Duration(minutes: 2), 'drink_water_channel', 'Uống nước', 'Nhắc uống nước đúng giờ');}, 
              child: Text("Gửi thông báo nhắc uống nước sau 2 phút")
              ),
            SizedBox(height: 20,),
            ElevatedButton(
              onPressed: () {notificationService.scheduleNotificationAfter(Duration(minutes: 10), 'study_english_channel', 'Học tiếng Anh', 'Nhớ học tiếng Anh');},
               child: Text("Hẹn giờ gửi thông báo học Ngoại ngữ sau 10 phút")
            ),
          ],
        ),
      ),
    );
  }
}