import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> with SingleTickerProviderStateMixin {
  final TextEditingController _messageController = TextEditingController();
  final List<Map<String, String>> _classChatMessages = [
    {'sender': 'user', 'message': 'Hi there in class chat!'},
    {'sender': 'other', 'message': 'Hello! How can I help you in class chat?'},
    // Add more messages as needed
  ];

  final List<Map<String, String>> _otherChatMessages = [
    {'sender': 'user', 'message': 'Hi there in other chat!'},
    {'sender': 'other', 'message': 'Hello! How can I help you in other chat?'},
    // Add more messages as needed
  ];

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Class Chat'),
            Tab(text: 'Other Chat'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildChat(_classChatMessages),
          _buildChat(_otherChatMessages),
        ],
      ),
    );
  }

  Widget _buildChat(List<Map<String, String>> messages) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: messages.length,
            reverse: true,
            itemBuilder: (context, index) {
              return _buildMessage(messages[index]);
            },
          ),
        ),
        _buildMessageInput(),
      ],
    );
  }

  Widget _buildMessage(Map<String, String> message) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: message['sender'] == 'user' ? Colors.blue : Colors.grey[300],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        message['message']!,
        style: TextStyle(
          color: message['sender'] == 'user' ? Colors.white : Colors.black,
        ),
      ),
    );
  }

  Widget _buildMessageInput() {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _messageController,
              decoration: const InputDecoration(
                hintText: 'Type your message...',
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: () {
              _sendMessage();
            },
          ),
        ],
      ),
    );
  }

  void _sendMessage() {
    final messageText = _messageController.text.trim();
    if (messageText.isNotEmpty) {
      setState(() {
        if (_tabController.index == 0) {
          _classChatMessages.add({'sender': 'user', 'message': messageText});
        } else {
          _otherChatMessages.add({'sender': 'user', 'message': messageText});
        }
        // Add logic to handle the response from the other user or backend
      });
      _messageController.clear();
    }
  }
}