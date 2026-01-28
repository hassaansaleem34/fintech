import 'package:fintech/core/constants/colors.dart';
import 'package:fintech/core/constants/image_string.dart';
import 'package:fintech/core/constants/string_text.dart';
import 'package:fintech/core/constants/text_style.dart';
import 'package:fintech/core/routes_screens/route_screens.dart';
import 'package:fintech/core/widgets/widgets_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PasswordRecovery extends StatefulWidget {
  const PasswordRecovery({super.key});

  @override
  State<PasswordRecovery> createState() => _PasswordRecoveryState();
}

class _PasswordRecoveryState extends State<PasswordRecovery> {
  final TextEditingController emailController = TextEditingController();
  bool isValidEmail = false;

  @override
  void initState() {
    super.initState();
    emailController.addListener(validateEmail);
  }

  void validateEmail() {
    final email = emailController.text;

    isValidEmail = RegExp(
      r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
    ).hasMatch(email);
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: SvgPicture.asset(AppAssets.backImage),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 20, top: 40, right: 30),
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
                  controller: emailController,
                  isEmail: true,
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
                        if (!isValidEmail) return; // ❌ block navigation
                        Navigator.pushNamed(
                          context,
                          MyRoutes.verifyScreen,
                          arguments: emailController.text,
                        );
                      },
                      backgroundColor:
                          ColorsUse.primaryButtonColor, // 🔵 always blue
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
