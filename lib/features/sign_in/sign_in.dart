import 'package:fintech/core/constants/colors.dart';
import 'package:fintech/core/constants/image_string.dart';
import 'package:fintech/core/constants/string_text.dart';
import 'package:fintech/core/constants/text_style.dart';
import 'package:fintech/core/routes_screens/route_screens.dart';
import 'package:fintech/core/widgets/widgets_constant.dart';

import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    emailController.addListener(validateForm);
    passwordController.addListener(validateForm);
  }

  void validateForm() {
    final email = emailController.text;
    final password = passwordController.text;

    final isValidEmail = RegExp(
      r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
    ).hasMatch(email);

    setState(() {
      isButtonEnabled = isValidEmail && password.length >= 6;
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(left: 40, top: 60, right: 10),
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

              // EMAIL
              Row(
                children: [
                  Text("Email Address", style: TextOnStyle.signIntyle),
                ],
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(right: 30),
                child: SignInTextField(
                  hintText: "Enter your Email",
                  svgPath: AppAssets.emailImage,
                  keyboardType: TextInputType.emailAddress,
                  maxLength: 50,
                  controller: emailController,
                  isEmail: true,
                ),
              ),

              SizedBox(height: 30),

              // PASSWORD
              Row(children: [Text("Password", style: TextOnStyle.signIntyle)]),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(right: 30),
                child: SignInTextField(
                  hintText: "password",
                  svgPath: AppAssets.lockImage,
                  maxLength: 50,
                  obscure: true,
                  controller: passwordController,
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

              // BUTTON
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(right: 30, top: 20),
                  child: AppButton(
                    text: Texts.countinueButton,
                    onPressed: () {
                      if (isButtonEnabled) {
                        Navigator.pushNamed(
                          context,
                          MyRoutes.simpleNavbarScreen,
                        );
                      }
                    },
                    backgroundColor: isButtonEnabled
                        ? ColorsUse.primaryButtonColor
                        : Colors.grey.shade400,
                  ),
                ),
              ),

              Spacer(),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don’t have an account?", style: TextOnStyle.signIntyle),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, MyRoutes.signUp);
                    },
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        color: ColorsUse.secondaryButtonColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
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
