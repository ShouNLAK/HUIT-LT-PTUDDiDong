
import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'add_contact_screen.dart';

class ContactManagerApp extends StatefulWidget {
  const ContactManagerApp({super.key});

  @override
  State<ContactManagerApp> createState() => _ContactManagerAppState();
}

class _ContactManagerAppState extends State<ContactManagerApp> {
  List<Contact> _contacts = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadContacts();
  }

  Future<void> _loadContacts() async {
    setState(() => _isLoading = true);
    if (await Permission.contacts.request().isGranted) {
      List<Contact> contacts = await FlutterContacts.getAll(properties: ContactProperties.all);
      setState(() {
        _contacts = contacts;
        _isLoading = false;
      });
    } else {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quản lý Danh Bạ'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AddContactScreen()),
              );
              if (result == true) {
                _loadContacts();
              }
            },
          )
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _contacts.isEmpty
              ? const Center(child: Text('Không có danh bạ nào.'))
              : ListView.builder(
                  itemCount: _contacts.length,
                  itemBuilder: (context, index) {
                    final contact = _contacts[index];
                    String phone = contact.phones.isNotEmpty
                        ? contact.phones.first.number
                        : 'No phone number';
                    return ListTile(
                      leading: (contact.photo?.thumbnail != null)
                          ? CircleAvatar(
                              backgroundImage: MemoryImage(contact.photo!.thumbnail!),
                            )
                          : CircleAvatar(
                              child: Text(contact.displayName?.isNotEmpty == true ? contact.displayName![0].toUpperCase() : '?'),
                            ),
                      title: Text(contact.displayName?.isNotEmpty == true ? contact.displayName! : 'Unknown'),
                      subtitle: Text(phone),
                    );
                  },
                ),
    );
  }
}

