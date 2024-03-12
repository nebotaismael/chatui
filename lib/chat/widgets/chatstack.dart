import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Import for time formatting

class ChatStack extends StatelessWidget {
  const ChatStack({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(30.0), // Round the avatar
        child: const CircleAvatar(
          backgroundColor: Colors.grey, // More WhatsApp-like placeholder color
          child: Icon(Icons.person, color: Colors.white), // Placeholder icon
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Nebota Ismael', style: TextStyle(fontWeight: FontWeight.bold)),
          Text(
            DateFormat('h:mm a').format(DateTime.now()), // Formatted time
            style: TextStyle(color: Colors.grey[600]),
          ),
        ],
      ),
      subtitle: const Text(
        'Testing the Text',
        maxLines: 1,
        overflow: TextOverflow.ellipsis, // Truncate long messages
      ),
      trailing: Column(
        // For badge and time alignment
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            // For unread message badge (if needed)
            padding: EdgeInsets.all(6.0),
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child:
                Text('2', style: TextStyle(color: Colors.white, fontSize: 12)),
          ),
          SizedBox(height: 5), // Small spacing
          Text(
            TimeOfDay.fromDateTime(DateTime.now()).hour.toString(),
            style: TextStyle(color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }
}
