import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ContainerMicAttach extends StatelessWidget {
  final String icon;
  const ContainerMicAttach({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(11.5),
      decoration: const BoxDecoration(
          color: Color.fromRGBO(237, 242, 246, 1), borderRadius: BorderRadius.all(Radius.circular(12))),
      child: SvgPicture.asset(icon, color: const Color.fromRGBO(43, 51, 62, 1)),
    );
  }
}
