import 'package:fintech/core/constants/colors.dart';
import 'package:fintech/core/constants/image_string.dart';
import 'package:fintech/core/constants/string_text.dart';
import 'package:fintech/core/constants/text_style.dart';
import 'package:fintech/core/routes_screens/route_screens.dart';
import 'package:fintech/core/widgets/widgets_constant.dart';
import 'package:flutter/material.dart';

class PasswordRecovery extends StatelessWidget {
  const PasswordRecovery({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(left: 20, top: 60, right: 30),
          child: Column(
            children: [
              Row(
                children: [
                  Text(Texts.Passwordrecovery, style: TextOnStyle.phoneNumber),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    Texts.enterRegistration,
                    style: TextOnStyle.phoneNumberDes,
                  ),
                ],
              ),
              SizedBox(height: 50),
              Row(
                children: [
                  SizedBox(width: 10),
                  Text("Email  Address", style: TextOnStyle.signIntyle),
                ],
              ),
              SizedBox(height: 10),
              Center(
                child: SignInTextField(
                  hintText: "Enter your Email",
                  svgPath: AppAssets.emailImage,
                  keyboardType: TextInputType.emailAddress,
                  maxLength: 50,
                ),
              ),
              SizedBox(height: 40),
              Center(
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: AppButton(
                      text: Texts.buttonTextSendEmail,
                      onPressed: () {
                        Navigator.pushNamed(context, MyRoutes.verifyScreen);
                      },
                      backgroundColor: ColorsUse.primaryButtonColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
