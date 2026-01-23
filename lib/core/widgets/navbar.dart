import 'package:fintech/features/authentication/address_screen/address_screen.dart';
import 'package:fintech/features/home_verified/home_verified.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SimpleNavBar extends StatefulWidget {
  const SimpleNavBar({super.key});

  @override
  State<SimpleNavBar> createState() => _SimpleNavBarState();
}

class _SimpleNavBarState extends State<SimpleNavBar> {
  int currentIndex = 0;

  final pages = [
    HomeVerified(),
    Container(), // Loan page
    Container(), // Bills page
    Container(), // More page
  ];

  Widget navIcon(String asset, bool isActive) {
    return SvgPicture.asset(
      asset,
      height: 24,
      width: 24,
      colorFilter: ColorFilter.mode(
        isActive ? Colors.red : const Color(0xff2D264B),
        BlendMode.srcIn,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: currentIndex, children: pages),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: navIcon(
              "assets/images/icons/home-3 3.svg",
              currentIndex == 0,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: navIcon(
              "assets/images/icons/Investment.svg",
              currentIndex == 1,
            ),
            label: "Loan",
          ),
          BottomNavigationBarItem(
            icon: navIcon("assets/images/icons/Menu.svg", currentIndex == 2),
            label: "Bills",
          ),
          BottomNavigationBarItem(
            icon: navIcon("assets/images/icons/Menu.svg", currentIndex == 3),
            label: "More",
          ),
        ],
      ),
    );
  }
}
