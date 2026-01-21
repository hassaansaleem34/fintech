import 'package:fintech/core/constants/colors.dart';
import 'package:fintech/core/constants/image_string.dart';
import 'package:fintech/core/constants/string_text.dart';
import 'package:fintech/core/constants/text_style.dart';
import 'package:fintech/core/routes_screens/route_screens.dart';

import 'package:fintech/core/widgets/widgets_constant.dart' as AppButton;
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset(AppAssets.backImage),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, top: 60, right: 30),
        child: Column(
          children: [
            Row(
              children: [
                Text(Texts.phoneNumber, style: TextOnStyle.phoneNumber),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text(Texts.phoneNumberDes, style: TextOnStyle.phoneNumberDes),
              ],
            ),
            SizedBox(height: 30),
            AppButton.MyTextField(
              text: Texts.hintText,
              obscure: false,
              controller: phoneController,
            ),
          ],
        ),
      ),

      bottomNavigationBar: SafeArea(
        child: AnimatedPadding(
          duration: const Duration(milliseconds: 300), // Required
          curve: Curves.easeInOut, // Smooth animation
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
            bottom: MediaQuery.of(context).viewInsets.bottom + 20,
          ),
          child: AppButton.AppButton(
            text: Texts.countinueButton,
            onPressed: () {
              Navigator.pushNamed(
                context,
                MyRoutes.otpVerify,
                arguments: phoneController.text,
              );
            },
            backgroundColor: ColorsUse.primaryButtonColor,
          ),
        ),
      ),
    );
  }
}
