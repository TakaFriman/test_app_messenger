import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:test_app_messenger/presentation/pages/chat_page/chat_test_page.dart';
import 'package:test_app_messenger/presentation/widgets/get_colors_initials.dart';
import 'package:test_app_messenger/services/auth/auth_service.dart';
import 'package:test_app_messenger/services/chat/chat_service.dart';
import 'package:test_app_messenger/presentation/pages/home_page/components/search_container.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void signOut() {
    final authService = Provider.of<AuthService>(context, listen: false);
    authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Чаты', style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600)),
                      GestureDetector(
                        onTap: signOut,
                        child: SvgPicture.asset(
                          'assets/icons/out.svg',
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  const SearchContainer(),
                  const SizedBox(height: 24),
                ],
              ),
            ),
            const Divider(color: Color.fromRGBO(237, 242, 246, 1), thickness: 1.5),
            _buildUserList(),
          ],
        ),
      ),
    );
  }

  Widget _buildUserList() {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('users').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text('error');
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: Text(
              'Загрузка...',
              style: TextStyle(fontSize: 14, color: Color.fromRGBO(94, 122, 144, 1)),
            ),
          );
        }
        return Expanded(
          child: ListView(
            children: snapshot.data!.docs.map<Widget>((doc) => _buildUserListItem(doc)).toList(),
          ),
        );
      },
    );
  }

  Widget _buildUserListItem(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data()! as Map<String, dynamic>;

    if (_auth.currentUser!.email != data['email']) {
      return FutureBuilder<Map<String, dynamic>?>(
        future: ChatService().getLastMessage(_auth.currentUser!.uid, data['uid']),
        builder: (context, snapshot) {
          String lastMessage = '${data['nickname']} теперь в чатах!';
          String lastMessageDate = '';

          if (snapshot.connectionState == ConnectionState.done && snapshot.hasData && snapshot.data != null) {
            lastMessage = snapshot.data!['message'] ?? '${data['nickname']} теперь в чатах!';
            lastMessageDate = formatDate(snapshot.data!['timestamp'].toDate().toString());
          }

          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatTestPage(
                    receiverNickname: data['nickname'],
                    receiverUserId: data['uid'],
                  ),
                ),
              );
            },
            child: Container(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
              color: Colors.transparent,
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        maxRadius: 25,
                        backgroundColor: getRandomColor(),
                        child: Text(
                          getInitials(data['nickname']),
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
                            const SizedBox(height: 4),
                            Text(
                              data['nickname'],
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              lastMessage,
                              style: const TextStyle(
                                fontSize: 12,
                                color: Color.fromRGBO(94, 122, 144, 1),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        lastMessageDate,
                        style: const TextStyle(
                          color: Color.fromRGBO(94, 122, 144, 1),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Divider(
                    color: Color.fromRGBO(237, 242, 246, 1),
                    thickness: 1.5,
                    height: 1,
                  ),
                ],
              ),
            ),
          );
        },
      );
    } else {
      return Container();
    }
  }
}

