import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_app_messenger/presentation/pages/auth_pages/login_page/components/my_text_field.dart';
import 'package:test_app_messenger/presentation/pages/chat_page/components/my_chat_bubble.dart';
import 'package:test_app_messenger/presentation/pages/chat_page/components/other_chat_bubble.dart';
import 'package:test_app_messenger/presentation/pages/home_page/components/chat_container.dart';
import 'package:test_app_messenger/services/chat/chat_service.dart';

class ChatTestPage extends StatefulWidget {
  final String receiverUserEmail;
  final String receiverUserId;
  const ChatTestPage({super.key, required this.receiverUserEmail, required this.receiverUserId});

  @override
  State<ChatTestPage> createState() => _ChatTestPageState();
}

class _ChatTestPageState extends State<ChatTestPage> {
  final TextEditingController _messageController = TextEditingController();
  final ChatService _chatService = ChatService();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void sendMessage() async {
    if (_messageController.text.isNotEmpty) {
      await _chatService.sendMessage(widget.receiverUserId, _messageController.text);

      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
          GestureDetector(
              child: SvgPicture.asset(
                'assets/icons/back.svg',
                color: const Color.fromRGBO(43, 51, 62, 1),
              ),
              onTap: () => Navigator.of(context).pop()),
          const SizedBox(width: 6),
          CircleAvatar(
            maxRadius: 25,
            backgroundColor: getRandomColor(),
            child: Text(
              getInitials('Виктор Власов'),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.receiverUserEmail,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Text(
                  'В сети',
                  style: TextStyle(
                    fontSize: 12,
                    color: Color.fromRGBO(94, 122, 144, 1),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const Divider(
              color: Color.fromRGBO(237, 242, 246, 1),
              thickness: 1.5,
              height: 1,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: _buildMessageList(),
              ),
            ),
            const Divider(
              color: Color.fromRGBO(237, 242, 246, 1),
              thickness: 1.5,
              height: 1,
            ),
            const SizedBox(height: 14),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: _buildMessageInput(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageList() {
    return StreamBuilder(
        stream: _chatService.getMessages(widget.receiverUserId, _firebaseAuth.currentUser!.uid),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Error${snapshot.error}');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text('loading...');
          }
          return ListView(
            children: snapshot.data!.docs.map((document) => _buildMessageItem(document)).toList(),
          );
        });
  }

  Widget _buildMessageItem(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data() as Map<String, dynamic>;

    var alignment = (data['senderId'] == _firebaseAuth.currentUser!.uid) ? Alignment.centerRight : Alignment.centerLeft;
    if (data['senderId'] == _firebaseAuth.currentUser!.uid) {
      return Container(
        alignment: alignment,
        child: Column(
          children: [MyChatBubble(message: data['message'], time: data['timestamp']), const SizedBox(height: 6)],
        ),
      );
    } else {
      return Container(
        alignment: alignment,
        child: Column(
          children: [OtherChatBubble(message: data['message'], time: data['timestamp']), const SizedBox(height: 6)],
        ),
      );
    }
  }

  Widget _buildMessageInput() {
    return Row(
      children: [
        GestureDetector(
            child: SvgPicture.asset(
              'assets/icons/back.svg',
              color: const Color.fromRGBO(43, 51, 62, 1),
            ),
            onTap: () {}),
        const SizedBox(width: 8),
        Expanded(
          child: MyTextField(
            controller: _messageController,
            hintText: 'Сообщение',
            obscureText: false,
          ),
        ),
        const SizedBox(width: 8),
        GestureDetector(
            onTap: sendMessage,
            child: SvgPicture.asset(
              'assets/icons/out.svg',
              color: const Color.fromRGBO(43, 51, 62, 1),
            )),
      ],
    );
  }
}
