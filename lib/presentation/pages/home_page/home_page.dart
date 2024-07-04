import 'package:flutter/material.dart';
import 'package:test_app_messenger/presentation/pages/home_page/components/chat_list.dart';
import 'package:test_app_messenger/presentation/pages/home_page/components/search_container.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20, top: 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Чаты', style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600)),
                  SizedBox(height: 6),
                  SearchContainer(),
                  SizedBox(height: 24),
                ],
              ),
            ),
            Divider(color: Color.fromRGBO(237, 242, 246, 1), thickness: 1.5),
            ChatList(),
          ],
        ),
      ),
    );
  }
}
