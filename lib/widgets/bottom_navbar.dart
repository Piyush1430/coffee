import "package:flutter/material.dart";
import "package:google_nav_bar/google_nav_bar.dart";

class MyBottomNavBar extends StatelessWidget {
  const MyBottomNavBar({Key? key, required this.onTabChange}) : super(key: key);
  final void Function(int)? onTabChange;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: GNav(
        onTabChange: (value) => onTabChange!(value),
        color: Colors.grey[400],
        activeColor: Colors.grey[700],
        tabBorder: Border.all(color: Colors.white),
        tabBorderRadius: 24,
        mainAxisAlignment: MainAxisAlignment.center,
        tabs: const [
          GButton(
            icon: Icons.home,
            text: "Shop",
          ),
          GButton(
            icon: Icons.shopping_bag,
            text: "Cart",
          )
        ],
      ),
    );
  }
}
