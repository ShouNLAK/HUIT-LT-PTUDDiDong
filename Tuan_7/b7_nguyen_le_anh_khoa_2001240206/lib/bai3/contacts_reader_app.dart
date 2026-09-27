import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';

class ContactsReaderApp extends StatefulWidget {
  const ContactsReaderApp({super.key});

  @override
  State<ContactsReaderApp> createState() => _ContactsReaderAppState();
}

class _ContactsReaderAppState extends State<ContactsReaderApp> {
  List<Contact> _contacts = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadContacts();
  }

  Future<void> _loadContacts() async {
    if (await FlutterContacts.permissions.request(PermissionType.readWrite) == PermissionStatus.granted) {
      List<Contact> contacts = await FlutterContacts.getAll(properties: ContactProperties.allProperties);
      setState(() {
        _contacts = contacts;
        _isLoading = false;
      });
    } else {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts Reader'),
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _contacts.isEmpty
              ? const Center(child: Text('No contacts found.'))
              : ListView.builder(
                  itemCount: _contacts.length,
                  itemBuilder: (context, index) {
                    final contact = _contacts[index];
                    String phone = contact.phones.isNotEmpty
                        ? contact.phones.first.number
                        : 'No phone number';
                    return ListTile(
                      title: Text(contact.displayName?.isNotEmpty == true ? contact.displayName! : 'Unknown'),
                      subtitle: Text(phone),
                    );
                  },
                ),
    );
  }
}
