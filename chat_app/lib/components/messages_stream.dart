import 'package:chat_app/components/message_bubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MessagesStream extends StatelessWidget {
  final FirebaseFirestore firestore;
  final String currentUser;
  const MessagesStream(
      {super.key, required this.firestore, required this.currentUser});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: firestore
          .collection('messages')
          .orderBy('ts', descending: true)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent,
            ),
          );
        }
        List<Widget> messageBubbles = [];
        final messages = snapshot.data?.docs;
        if (messages != null) {
          for (var message in messages) {
            final messageMap = message.data() as Map<String, dynamic>;
            final messageText = messageMap['text'];
            final messageSender = messageMap['sender'];
            final messageBubble = MessageBubble(
              sender: messageSender,
              text: messageText,
              currentUser: currentUser,
            );
            messageBubbles.add(messageBubble);
          }
        }
        return Expanded(
          child: ListView(
            reverse: true,
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 20,
            ),
            children: messageBubbles,
          ),
        );
      },
    );
  }
}
