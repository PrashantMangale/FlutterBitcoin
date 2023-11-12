import 'package:flutter/material.dart';

class BottomNavItem extends StatelessWidget {
  final String iconName;

  const BottomNavItem({super.key, required this.iconName});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 50,
      color: Colors.transparent,
      margin: const EdgeInsets.only(bottom: 5),
      padding: const EdgeInsets.symmetric(vertical: 10),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(image: AssetImage(iconName)),
        ],
      ),
    );
  }
}
