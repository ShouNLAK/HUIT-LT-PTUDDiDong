import 'package:flutter/material.dart';
import 'package:another_telephony/telephony.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:intl/intl.dart';

class SmsAnalyzerApp extends StatefulWidget {
  const SmsAnalyzerApp({super.key});

  @override
  State<SmsAnalyzerApp> createState() => _SmsAnalyzerAppState();
}

class _SmsAnalyzerAppState extends State<SmsAnalyzerApp> {
  final Telephony telephony = Telephony.instance;
  List<SmsMessage> _allMessages = [];
  bool _isLoading = true;
  String _searchPhone = '';

  @override
  void initState() {
    super.initState();
    _loadMessages();
  }

  Future<void> _loadMessages() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.sms,
      Permission.phone,
    ].request();

    if (statuses[Permission.sms]!.isGranted) {
      List<SmsMessage> messages = await telephony.getInboxSms(
        columns: [SmsColumn.ADDRESS, SmsColumn.BODY, SmsColumn.DATE],
        sortOrder: [OrderBy(SmsColumn.DATE, sort: Sort.DESC)],
      );
      setState(() {
        _allMessages = messages;
        _isLoading = false;
      });
    } else {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Vui lòng cấp quyền SMS để phân tích.')),
        );
      }
    }
  }
  List<SmsMessage> get filteredMessages {
    if (_searchPhone.isEmpty) return _allMessages;
    return _allMessages
        .where((m) =>
            m.address != null &&
            m.address!.toLowerCase().contains(_searchPhone.toLowerCase()))
        .toList();
  }

  int get totalMessages => filteredMessages.length;
  List<SmsMessage> get qcMessages => filteredMessages
      .where((m) {
        String body = (m.body ?? '').trim().toUpperCase();
        return body.startsWith('[QC]') || body.startsWith('QC');
      })
      .toList();
  List<SmsMessage> get otpMessages {
    return filteredMessages.where((m) {
      final body = (m.body ?? '').toUpperCase();
      return body.contains('OTP') && RegExp(r'\b\d{6}\b').hasMatch(body);
    }).toList();
  }

  String extractOtp(String body) {
    RegExp regExp = RegExp(r'\b(\d{6})\b');
    Match? match = regExp.firstMatch(body);
    return match != null ? match.group(1)! : 'Không tìm thấy';
  }

  void _showOtpDialog(String otpCode) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Text('Mã OTP của bạn', textAlign: TextAlign.center),
        content: Text(
          otpCode,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            letterSpacing: 8,
            color: Colors.blueAccent,
          ),
        ),
        actions: [
          Center(
            child: ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
              ),
              child: const Text('ĐÓNG'),
            ),
          )
        ],
      ),
    );
  }

  void _showMonthlyStats() {
    Map<String, int> stats = {};
    for (var m in _allMessages) {
      if (m.date != null) {
        DateTime dt = DateTime.fromMillisecondsSinceEpoch(m.date!);
        String monthYear = DateFormat('MM/yyyy').format(dt);
        stats[monthYear] = (stats[monthYear] ?? 0) + 1;
      }
    }

    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Thống Kê Theo Tháng',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),
              stats.isEmpty
                  ? const Text('Chưa có dữ liệu.')
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: stats.length,
                      itemBuilder: (context, index) {
                        String key = stats.keys.elementAt(index);
                        return ListTile(
                          leading: const Icon(Icons.calendar_month, color: Colors.blue),
                          title: Text('Tháng $key'),
                          trailing: Text(
                            '${stats[key]} tin nhắn',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        );
                      },
                    ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text('SMS Analyzer', style: TextStyle(fontWeight: FontWeight.bold)),
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        actions: [
          IconButton(
            icon: const Icon(Icons.pie_chart_outline),
            tooltip: 'Thống kê theo tháng',
            onPressed: _showMonthlyStats,
          )
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : DefaultTabController(
              length: 3,
              child: Column(
                children: [
                  Container(
                    color: Colors.white,
                    child: const TabBar(
                      labelColor: Colors.blueAccent,
                      unselectedLabelColor: Colors.grey,
                      indicatorColor: Colors.blueAccent,
                      indicatorWeight: 3,
                      labelStyle: TextStyle(fontWeight: FontWeight.bold),
                      tabs: [
                        Tab(text: 'Thống kê chung'),
                        Tab(text: 'Quảng Cáo'),
                        Tab(text: 'Mã OTP'),
                      ],
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        _buildGeneralStatsTab(),
                        _buildMessageList(qcMessages, emptyMessage: 'Không có tin nhắn quảng cáo nào.'),
                        _buildOtpTab(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  Widget _buildGeneralStatsTab() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withValues(alpha: 0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                )
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Tổng số tin nhắn nhận được',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                Text(
                  '$totalMessages',
                  style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Lọc theo số điện thoại...',
              prefixIcon: const Icon(Icons.search),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
            ),
            onChanged: (val) {
              setState(() {
                _searchPhone = val;
              });
            },
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Tất cả tin nhắn:',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: _buildMessageList(filteredMessages, emptyMessage: 'Không có tin nhắn nào.'),
        ),
      ],
    );
  }

  Widget _buildMessageList(List<SmsMessage> msgs, {required String emptyMessage}) {
    if (msgs.isEmpty) {
      return Center(
        child: Text(emptyMessage, style: const TextStyle(color: Colors.grey)),
      );
    }
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: msgs.length,
      separatorBuilder: (_, __) => const SizedBox(height: 10),
      itemBuilder: (context, index) {
        final m = msgs[index];
        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    m.address ?? 'Unknown',
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  if (m.date != null)
                    Text(
                      DateFormat('dd/MM HH:mm').format(
                          DateTime.fromMillisecondsSinceEpoch(m.date!)),
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                m.body ?? '',
                style: const TextStyle(color: Colors.black87, height: 1.4),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildOtpTab() {
    if (otpMessages.isEmpty) {
      return const Center(
        child: Text('Không có tin nhắn OTP nào.', style: TextStyle(color: Colors.grey)),
      );
    }
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: otpMessages.length,
      separatorBuilder: (_, __) => const SizedBox(height: 10),
      itemBuilder: (context, index) {
        final m = otpMessages[index];
        return InkWell(
          onTap: () {
            String code = extractOtp(m.body ?? '');
            _showOtpDialog(code);
          },
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.blue.withValues(alpha: 0.3)),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.blue.withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.password, color: Colors.blueAccent),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        m.address ?? 'Unknown',
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        m.body ?? '',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
