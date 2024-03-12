import 'package:auto_route/auto_route.dart';
import 'package:chatui/chat/widgets/appbar.dart';
import 'package:chatui/chat/widgets/chatstack.dart';
import 'package:chatui/chat/widgets/searchbar.dart';
import 'package:chatui/chat/widgets/story.dart';
import 'package:chatui/core/utils/popmenu.dart';
import 'package:chatui/main.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ChatsLight extends StatelessWidget {
  ChatsLight({super.key});

  final List<Contact> _contacts = [
    // ... Add your predefined contacts here
    Contact(name: 'Alice', imageUrl: 'https://example.com/alice.png'),
    Contact(name: 'Bob', imageUrl: 'https://example.com/bob.png'),
    // ... Add more contacts
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const AppDrawer2(),
      appBar: TopBar(context, 'chats'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: S.setHeight(10),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Story(
                  url: 'assets/images/baby.png',
                ),
                Story(
                  url: 'assets/images/pregnant_woman.png',
                ),
                Story(
                  url: 'assets/images/complete_1.png',
                )
              ],
            ),
            SizedBox(
              height: S.setHeight(10),
            ),
            SizedBox(
              width: S.screenHeight * 0.7,
              child: const SearchBar(
                hintText: 'Search here',
              ),
            ),
            SizedBox(
              height: S.setHeight(10),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: _contacts
                  .length, // Use the length of your predefined contacts
              itemBuilder: (context, index) {
                final contact = _contacts[index];
                return const ChatStack();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Contact {
  final String name;
  final String imageUrl;

  Contact({required this.name, required this.imageUrl});
}
