import "package:flutter/material.dart";

import "package:coffee/widgets/bottom_navbar.dart";
import "package:coffee/screen/coffee.dart";
import "package:coffee/screen/cart.dart";
import "package:coffee/widgets/main_drawer.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key});


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _slectedIndex = 0;

  void bottomNavBar(int index) {
    setState(() {
      _slectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    const CoffeeScreen(),
    const  CartScreen( ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
         drawer: _slectedIndex ==0? const MainDrawer() : null,
        bottomNavigationBar: MyBottomNavBar(
          onTabChange: (index) => bottomNavBar(index),
        ),
        body: _pages[_slectedIndex]);
  }
}
