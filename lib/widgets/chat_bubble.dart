import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({
    super.key,
    required this.chatData,
  });
  final Map<String, dynamic> chatData;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment:
          chatData['isSent'] ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5.0),
        padding: const EdgeInsets.all(12.0),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.75,
        ),
        decoration: BoxDecoration(
          color: chatData['isSent'] ? Colors.blue[600] : Colors.grey[200],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(chatData['isSent'] ? 12 : 0),
            topRight: Radius.circular(chatData['isSent'] ? 0 : 12),
            bottomLeft: const Radius.circular(12),
            bottomRight: const Radius.circular(12),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: chatData['isSent']
              ? CrossAxisAlignment.end
              : CrossAxisAlignment.start,
          children: [
            Text(
              chatData['message'],
              style: TextStyle(
                color: chatData['isSent'] ? Colors.white : Colors.black87,
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 4),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  chatData['time'],
                  style: TextStyle(
                    fontSize: 11,
                    color: chatData['isSent'] ? Colors.white70 : Colors.black54,
                  ),
                ),
                if (chatData['isSent']) ...[
                  const SizedBox(width: 4),
                  Icon(
                    chatData['status'] == 'read'
                        ? Icons.done_all
                        : chatData['status'] == 'delivered'
                            ? Icons.done_all
                            : Icons.done,
                    size: 14,
                    color: chatData['status'] == 'read'
                        ? Colors.blue[100]
                        : Colors.white70,
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}
