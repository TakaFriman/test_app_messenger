import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_app_messenger/presentation/pages/home_page/components/chat_container.dart';

class ChatPage extends StatelessWidget {
  final String name;
  final String messenger;
  final String date;

  const ChatPage({super.key, required this.name, required this.messenger, required this.date});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
            GestureDetector(child: SvgPicture.asset('assets/icons/back.svg'), onTap: () => Navigator.of(context).pop()),
            const SizedBox(width: 6),
            CircleAvatar(
              maxRadius: 25,
              backgroundColor: getRandomColor(),
              child: Text(
                getInitials(name),
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
                    name,
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
        body: const Column(
          children: [
            Divider(color: Color.fromRGBO(237, 242, 246, 1), thickness: 1.5),
          ],
        ));
  }
}
