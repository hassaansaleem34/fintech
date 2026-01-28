import 'package:fintech/core/constants/colors.dart';

import 'package:fintech/core/widgets/transaction.dart';
import 'package:fintech/features/home_verified/see_all.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeVerified extends StatefulWidget {
  const HomeVerified({super.key});

  @override
  State<HomeVerified> createState() => _HomeVerifiedState();
}

class _HomeVerifiedState extends State<HomeVerified> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 20,
              top: 60,
              right: 20,
              bottom: 120,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Hi, Divine 👋🏿",
                      style: TextStyle(
                        color: Color(0xff1F1F1F),
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Spacer(),

                    Text(
                      "Add Money ",
                      style: TextStyle(
                        color: ColorsUse.onBoardContainer,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SvgPicture.asset("assets/images/icons/Add_money.svg"),
                  ],
                ),
                SizedBox(height: 30),
                Container(
                  height: 141,
                  width: 329,
                  decoration: BoxDecoration(
                    color: ColorsUse.onBoardContainer,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,

                    children: [
                      SizedBox(height: 20),
                      Text(
                        "Account Balance",
                        style: TextStyle(color: Color(0xffD7D7D7)),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "₦ 2,554,706",
                            style: TextStyle(
                              color: Color(0xffFFFFFF),
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              fontFamily: "inter",
                            ),
                          ),
                          SizedBox(width: 10),
                          SvgPicture.asset("assets/images/icons/view_3.svg"),
                        ],
                      ),
                      SizedBox(height: 20),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Wema Bank",
                            style: TextStyle(
                              color: Color(0xffFFFFFF),
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SvgPicture.asset(
                            "assets/images/icons/content_copy 1.svg",
                          ),
                          Text(
                            "1100326447",
                            style: TextStyle(
                              color: Color(0xffFFFFFF),
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),

                SvgPicture.asset("assets/images/icons/Slider.svg"),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(4, (index) {
                      final icons = [
                        "assets/images/icons/Airtime.svg",
                        "assets/images/icons/wifi.svg",
                        "assets/images/icons/tv.svg",
                        "assets/images/icons/electric.svg",
                      ];

                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: SvgPicture.asset(
                          icons[index],
                          color: selectedIndex == index
                              ? Colors.blue
                              : ColorsUse.onBoardContainer,
                          width: 30,
                          height: 30,
                        ),
                      );
                    }),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Airtime",
                        style: TextStyle(
                          color: ColorsUse.onBoardContainer,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "Data",
                        style: TextStyle(
                          color: ColorsUse.onBoardContainer,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "Cable Tv",
                        style: TextStyle(
                          color: ColorsUse.onBoardContainer,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "Electricity",
                        style: TextStyle(
                          color: ColorsUse.onBoardContainer,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Row(
                  children: [
                    Text(
                      "Recent Transactions",
                      style: TextStyle(
                        color: Color(0xff1F1F1F),
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AllTransactionsScreen(),
                          ),
                        );
                      },
                      child: Text(
                        "See all",
                        style: TextStyle(
                          color: Color(0xff1F1F1F),
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    SvgPicture.asset("assets/images/icons/icon_clock.svg"),
                    Text(
                      "Today",
                      style: TextStyle(
                        color: Color(0xff1F1F1F),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SvgPicture.asset(
                      "assets/images/icons/cash.svg",
                      height: 24,
                      width: 24,
                    ),
                  ],
                ),

                Column(
                  children: [
                    TransactionCard(
                      title: "Loan Repayment",
                      time: "10:30pm",
                      amount: "- ₦ 1,800,400",
                      amountColor: Colors.red,
                      iconBg: Color(0xffEAF1FF),
                      icon: Image.asset("assets/images/icons/Mask group.png"),
                    ),
                    TransactionCard(
                      title: "Wallet Top Up",
                      time: "5:45pm",
                      amount: "+ ₦ 2,500",
                      amountColor: Colors.green,
                      iconBg: Color(0xffEEF6FF),
                      icon: SvgPicture.asset(
                        "assets/images/icons/plus.svg",
                        height: 22,
                      ),
                    ),
                    TransactionCard(
                      title: "Victor Isaac",
                      time: "10:45pm",
                      amount: "+ ₦ 800,000",

                      amountColor: Color(0xff5AD78B),
                      iconBg: Color(0xffFFF1E8),
                      icon: SvgPicture.asset(
                        "assets/images/icons/VI.svg",
                        height: 22,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    SvgPicture.asset("assets/images/icons/icon_clock.svg"),
                    Text(
                      "21 Sep 2022",
                      style: TextStyle(
                        color: Color(0xff1F1F1F),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Column(
                  children: [
                    TransactionCard(
                      title: "DSTV Subscription",
                      time: "10:30pm",
                      amount: "- ₦ 1,800,400",
                      amountColor: Color(0xff7C18FB),
                      iconBg: Color(0xffEAF1FF),
                      icon: Image.asset("assets/images/logo/Ellipse 37.png"),
                    ),
                    TransactionCard(
                      title: "Wisdom Olatayo",
                      time: "5:45pm",
                      amount: "+ ₦ 2,500",
                      amountColor: Color(0xffF59300),
                      iconBg: Color(0xffEEF6FF),
                      icon: SvgPicture.asset(
                        "assets/images/icons/WO.svg",
                        height: 20,
                      ),
                    ),
                    TransactionCard(
                      title: "Victor Isaac",
                      time: "10:45pm",
                      amount: "+ ₦ 800,000",

                      amountColor: Color(0xff5AD78B),
                      iconBg: Color(0xffFFF1E8),
                      icon: SvgPicture.asset(
                        "assets/images/icons/VI.svg",
                        height: 20,
                      ),
                    ),
                    TransactionCard(
                      title: "Eko Electrical",
                      time: "10:45pm",
                      amount: "- ₦ 800,000",

                      amountColor: Color(0xffF81111),
                      iconBg: Color(0xffFFF1E8),
                      icon: Image.asset(
                        "assets/images/logo/Ellipse 37 (1).png",
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
