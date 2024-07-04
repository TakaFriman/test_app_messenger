import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SearchContainer extends StatelessWidget {
  const SearchContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 8, top: 9, bottom: 9),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(237, 242, 246, 1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset('assets/icons/search.svg', color: const Color.fromRGBO(157, 183, 203, 1)),
          const SizedBox(width: 6),
          Expanded(
            child: TextField(
              onChanged: (value) => () {},
              style: const TextStyle(
                color: Color.fromRGBO(25, 28, 46, 1),
                fontSize: 14,
                fontWeight: FontWeight.w300,
              ),
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.zero,
                  isCollapsed: true,
                  hintText: 'Поиск',
                  hintStyle:
                      TextStyle(color: Color.fromRGBO(157, 183, 203, 1), fontSize: 16, fontWeight: FontWeight.w500)),
            ),
          ),
        ],
      ),
    );
  }
}
