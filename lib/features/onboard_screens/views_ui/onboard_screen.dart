import 'package:fintech/core/constants/colors.dart';
import 'package:fintech/core/constants/image_string.dart';
import 'package:fintech/core/constants/text_style.dart';
import 'package:fintech/core/routes_screens/route_screens.dart';
import 'package:fintech/core/widgets/widgets_constant.dart';
import 'package:fintech/features/onboard_screens/data/data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({super.key});

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  int currentPage = 0;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageView.builder(
          controller: _pageController,
          itemCount: onBoardData.length,
          physics: const NeverScrollableScrollPhysics(),
          onPageChanged: (index) {
            setState(() => currentPage = index);
          },
          itemBuilder: (context, index) {
            final data = onBoardData[index];

            return Column(
              children: [
                _topSection(data.image),
                const SizedBox(height: 10),
                _dotsRow(),
                const SizedBox(height: 80),
                Text(data.title, style: TextOnStyle.h1),
                const SizedBox(height: 10),
                Text(
                  data.subtitle,
                  textAlign: TextAlign.center,
                  style: TextOnStyle.h2,
                ),
                const SizedBox(height: 40),
                AppButton(
                  text: data.isLast ? "Get Started" : "Next",
                  backgroundColor: ColorsUse.secondaryButtonColor,
                  onPressed: () {
                    if (data.isLast) {
                      Navigator.pushNamed(context, MyRoutes.signUp);
                    } else {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.ease,
                      );
                    }
                  },
                ),
                if (!data.isLast) ...[
                  const SizedBox(height: 10),
                  AppButton(
                    text: "Skip",
                    backgroundColor: ColorsUse.primaryButtonColor,
                    onPressed: () {
                      _pageController.jumpToPage(onBoardData.length - 1);
                    },
                  ),
                ],
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _topSection(String image) {
    return Container(
      height: 444,
      width: double.infinity,
      color: ColorsUse.onBoardContainer,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppAssets.mainAppLogo),
            const SizedBox(height: 80),
            SvgPicture.asset(image),
          ],
        ),
      ),
    );
  }

  Widget _dotsRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        onBoardData.length,
        (index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Icon(
            Icons.circle,
            size: 8,
            color: currentPage == index
                ? ColorsUse.secondaryButtonColor
                : const Color(0XFFC4C4C4),
          ),
        ),
      ),
    );
  }
}
