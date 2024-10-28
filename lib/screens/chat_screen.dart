import 'package:flutter/material.dart';
import 'package:todo_chat_app/widgets/chat_bubble.dart';
import 'package:todo_chat_app/widgets/user_profile_sheet.dart';
import 'package:todo_chat_app/widgets/vertical_options.dart';

enum Status { sending, sent, failed, received }

enum Type { text, image, file, link }

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final List<Map<String, dynamic>> chatDatas = [
    {
      'message': 'Hi there!',
      'seen': true,
      'isSender': true,
      'time': '10:00 AM',
      'status': Status.sent,
      'type': Type.text,
      'edited': false,
    },
    {
      'message': 'Hello! How are you?',
      'seen': false,
      'isSender': false,
      'time': '10:02 AM',
      'status': Status.received,
      'type': Type.text,
      'edited': false,
    },
    {
      'message': 'I am good, thanks!',
      'seen': true,
      'isSender': true,
      'time': '10:03 AM',
      'status': Status.sent,
      'type': Type.text,
      'edited': false,
    },
    {
      'message': 'That\'s great to hear.',
      'seen': false,
      'isSender': false,
      'time': '10:04 AM',
      'status': Status.received,
      'type': Type.text,
      'edited': false,
    },
    {
      'message': 'Let\'s catch up later.',
      'seen': true,
      'isSender': true,
      'time': '10:05 AM',
      'status': Status.sent,
      'type': Type.text,
      'edited': false,
    },
  ];

  final List<Map<String, dynamic>> chatData = [
    {
      'message': 'Hi there!',
      'isSent': true,
      'time': '10:00 AM',
      'status': 'read',
      'type': 'text'
    },
    {
      'message': 'Hello! How are you?',
      'isSent': false,
      'time': '10:02 AM',
      'status': 'delivered',
      'type': 'text'
    },
    {
      'message': 'I am good, thanks!',
      'isSent': true,
      'time': '10:03 AM',
      'status': 'sent',
      'type': 'text'
    },
    {
      'message': 'That\'s great to hear.',
      'isSent': false,
      'time': '10:04 AM',
      'status': 'delivered',
      'type': 'text'
    },
    {
      'message': 'Let\'s catch up later.',
      'isSent': true,
      'time': '10:05 AM',
      'status': 'sent',
      'type': 'text'
    },
  ];

  void _sendMessage() {
    if (_messageController.text.trim().isNotEmpty) {
      setState(() {
        chatData.add({
          'message': _messageController.text,
          'isSent': true,
          'time': '${DateTime.now().hour}:${DateTime.now().minute}',
          'status': 'sent',
          'type': 'text'
        });
      });
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 3,
        leading: Padding(
          padding: const EdgeInsets.all(0.0),
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        titleSpacing: 0,
        title: GestureDetector(
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const UserProfileSheet(),
            ),
          ),
          child: const Padding(
            padding: EdgeInsets.all(0.0),
            child: ListTile(
              leading: CircleAvatar(
                child: Icon(
                  Icons.person,
                ),
              ),
              title: Text(
                'John Doe',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                'Last seen today at 10:00 AM',
                style: TextStyle(
                  fontSize: 10,
                ),
              ),
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.call,
            ),
          ),
          const VerticalOptions(),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
              itemCount: chatData.length,
              itemBuilder: (context, index) {
                return ChatBubble(chatData: chatData[index]);
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: const Offset(0, -1),
                ),
              ],
            ),
            child: SafeArea(
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.emoji_emotions_outlined,
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      controller: _messageController,
                      decoration: InputDecoration(
                        hintText: 'Type a message',
                        hintStyle: TextStyle(color: Colors.grey[400]),
                        border: InputBorder.none,
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 16.0),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.attach_file,
                    ),
                  ),
                  IconButton(
                    onPressed: _sendMessage,
                    icon: const Icon(
                      Icons.send,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
