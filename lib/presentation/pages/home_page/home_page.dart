import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:test_app_messenger/domain/auth/auth.dart';
import 'package:test_app_messenger/presentation/pages/home_page/components/chat_list.dart';
import 'package:test_app_messenger/presentation/pages/home_page/components/search_container.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          child: SvgPicture.asset(
                            'assets/icons/out.svg',
                            color: Colors.black,
                          ),
                          onTap: () {
                            _auth.signOut();
                          }),
                    ],
                  ),
                  const SizedBox(height: 6),
                  const SearchContainer(),
                  const SizedBox(height: 24),
                ],
              ),
            ),
            const Divider(color: Color.fromRGBO(237, 242, 246, 1), thickness: 1.5),
            const ChatList(),
          ],
        ),
      ),
    );
  }
}
