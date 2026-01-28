import 'package:fintech/core/constants/colors.dart';
import 'package:fintech/core/constants/string_text.dart';
import 'package:fintech/core/constants/text_style.dart';
import 'package:fintech/core/routes_screens/route_screens.dart';
import 'package:fintech/core/widgets/widgets_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RequestLoan extends StatelessWidget {
  const RequestLoan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },

          child: Icon(Icons.arrow_back_ios_sharp, color: Colors.black),
        ),
        title: Text("Loan Request Form", style: TextOnStyle.loanAppBarStyle),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Complete the following requirements to gain \nfull access your account on FinPadi.",
                  style: TextOnStyle.phoneNumberDes,
                ),
              ],
            ),
            const SizedBox(height: 60),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Update Next of Kin",
                        style: TextOnStyle.loanRequestStyle,
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 30),
                        child: SvgPicture.asset(
                          "assets/images/icons/correct_icon.svg",
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Text(
                        "Verify your identity",
                        style: TextOnStyle.loanRequestStyle,
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 30),
                        child: SvgPicture.asset(
                          "assets/images/icons/alert_icon.svg",
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Text(
                        "Add a valid debit card",
                        style: TextOnStyle.loanRequestStyle,
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 30),
                        child: SvgPicture.asset(
                          "assets/images/icons/alert_icon.svg",
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Text(
                        "Connect A Bank Account",
                        style: TextOnStyle.loanRequestStyle,
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 30),
                        child: SvgPicture.asset(
                          "assets/images/icons/alert_icon.svg",
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Spacer(),
            AppButton(
              text: Texts.getLoan,
              onPressed: () {
                Navigator.pushNamed(context, MyRoutes.fillForm);
              },
              backgroundColor: ColorsUse.primaryButtonColor,
            ),
          ],
        ),
      ),
    );
  }
}
