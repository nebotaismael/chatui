import 'package:auto_route/auto_route.dart';
import 'package:chatui/chat/widgets/appbar.dart';
import 'package:chatui/core/utils/popmenu.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ContactsLight extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SelectContactsScreen(onContactsSelected: (contact) {});
  }
}

class SelectContactsScreen extends StatefulWidget {
  final Function(List<Contact>)
      onContactsSelected; // Callback for selected contacts

  const SelectContactsScreen({required this.onContactsSelected});

  @override
  _SelectContactsScreenState createState() => _SelectContactsScreenState();
}

class _SelectContactsScreenState extends State<SelectContactsScreen> {
  final List<Contact> _contacts = [
    // ... Add your predefined contacts here
    Contact(name: 'Alice', imageUrl: 'https://example.com/alice.png'),
    Contact(name: 'Bob', imageUrl: 'https://example.com/bob.png'),
    Contact(name: 'Charlie', imageUrl: 'https://example.com/charlie.png'),
    Contact(name: 'David', imageUrl: 'https://example.com/david.png'),
    Contact(name: 'Eve', imageUrl: 'https://example.com/eve.png'),
  ];

  final _selectedContacts = <Contact>[]; // List to store selected contacts

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: AppDrawer2(),
      appBar: TopBar(context, 'contacts'),
      body: ListView.separated(
        itemCount: _contacts.length,
        separatorBuilder: (context, index) =>
            Divider(height: 1.0, color: Colors.grey[300]), // Separator line
        itemBuilder: (context, index) {
          final contact = _contacts[index];
          return CheckboxListTile(
            title: Text(contact.name),
            subtitle: Text('Status...'), // Placeholder for status

            value: _selectedContacts.contains(contact),
            onChanged: (value) {
              setState(() {
                if (value!) {
                  _selectedContacts.add(contact);
                } else {
                  _selectedContacts.remove(contact);
                }
              });
            },
          );
        },
      ),
    );
  }
}

class Contact {
  final String name;
  final String imageUrl;

  Contact({required this.name, required this.imageUrl});
}
