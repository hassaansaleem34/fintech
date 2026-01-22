import 'package:fintech/core/constants/colors.dart';
import 'package:fintech/core/constants/image_string.dart';
import 'package:fintech/core/constants/string_text.dart';
import 'package:fintech/core/constants/text_style.dart';
import 'package:fintech/core/routes_screens/route_screens.dart';
import 'package:fintech/core/widgets/widgets_constant.dart';

import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

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
                  Text(Texts.helloThere, style: TextOnStyle.phoneNumber),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    Texts.signIntoYourAcc,
                    style: TextOnStyle.phoneNumberDes,
                  ),
                ],
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  Text("Email  Address", style: TextOnStyle.signIntyle),
                ],
              ),
              SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.only(right: 30),
                child: SignInTextField(
                  hintText: "Enter your Email",
                  svgPath: AppAssets.emailImage,
                  keyboardType: TextInputType.emailAddress,
                  maxLength: 50,
                ),
              ),
              SizedBox(height: 30),
              Row(children: [Text("Password", style: TextOnStyle.signIntyle)]),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(right: 30),
                child: SignInTextField(
                  hintText: "password",
                  svgPath: AppAssets.LockImage,

                  maxLength: 50,
                  obscure: true,
                ),
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        MyRoutes.passwordRecoveryScreen,
                      );
                    },
                    child: Text(
                      Texts.forgotpassword,
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: "Lato",
                        fontWeight: FontWeight.w700,
                        color: ColorsUse.secondaryButtonColor,
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20),
              Center(
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: AppButton(
                      text: Texts.countinueButton,
                      onPressed: () {
                        Navigator.pushNamed(context, MyRoutes.signInScreen);
                      },
                      backgroundColor: ColorsUse.primaryButtonColor,
                    ),
                  ),
                ),
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don’t have an account?", style: TextOnStyle.signIntyle),
                  Text(
                    "Sign Up",
                    style: TextStyle(
                      color: ColorsUse.secondaryButtonColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
