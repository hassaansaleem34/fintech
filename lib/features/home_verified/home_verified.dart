import 'package:fintech/core/constants/colors.dart';
import 'package:fintech/core/widgets/navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeVerified extends StatelessWidget {
  const HomeVerified({super.key});

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
                  padding: const EdgeInsets.only(left: 40, right: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset("assets/images/icons/Airtime.svg"),
                      SvgPicture.asset("assets/images/icons/wifi.svg"),
                      SvgPicture.asset("assets/images/icons/tv.svg"),
                      SvgPicture.asset("assets/images/icons/electric.svg"),
                    ],
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
                    Text(
                      "See all",
                      style: TextStyle(
                        color: Color(0xff1F1F1F),
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      // bottomNavigationBar: SimpleNavBar(),
    );
  }
}
