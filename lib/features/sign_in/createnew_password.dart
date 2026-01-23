import 'package:fintech/core/constants/colors.dart';
import 'package:fintech/core/constants/image_string.dart';
import 'package:fintech/core/constants/string_text.dart';
import 'package:fintech/core/constants/text_style.dart';
import 'package:fintech/core/routes_screens/route_screens.dart';
import 'package:fintech/core/widgets/widgets_constant.dart';
import 'package:flutter/material.dart';

class CreatenewPassword extends StatefulWidget {
  const CreatenewPassword({super.key});

  @override
  State<CreatenewPassword> createState() => _CreatenewPasswordState();
}

class _CreatenewPasswordState extends State<CreatenewPassword> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmController = TextEditingController();

  bool _showPasswordError = false;
  bool _showConfirmError = false;

  void _validatePassword(String value) {
    setState(() {
      _showPasswordError = value.length < 6;
      _showConfirmError = _confirmController.text != value;
    });
  }

  void _validateConfirmPassword(String value) {
    setState(() {
      _showConfirmError = value != _passwordController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(left: 20, top: 60, right: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(Texts.createNewpassword, style: TextOnStyle.phoneNumber),
              const SizedBox(height: 10),
              Text(Texts.pleaseEnter, style: TextOnStyle.phoneNumberDes),
              const SizedBox(height: 60),

              Row(
                children: [
                  SizedBox(width: 18),
                  Text("Enter new password", style: TextOnStyle.signIntyle),
                ],
              ),
              const SizedBox(height: 10),
              Center(
                child: PasswordChangeTextField(
                  controller: _passwordController,
                  hintText: "",
                  suffixSvgPath: AppAssets.LockImage,
                  maxLength: 50,
                  obscure: true,
                  onChanged: _validatePassword,
                ),
              ),
              if (_showPasswordError)
                const Padding(
                  padding: EdgeInsets.only(top: 6),
                  child: Text(
                    "Enter at least 6 digit password",
                    style: TextStyle(color: Colors.red, fontSize: 12),
                  ),
                ),

              const SizedBox(height: 20),

              Row(
                children: [
                  SizedBox(width: 20),
                  Text("Confirm new password", style: TextOnStyle.signIntyle),
                ],
              ),
              const SizedBox(height: 10),
              Center(
                child: PasswordChangeTextField(
                  controller: _confirmController,
                  hintText: "",
                  suffixSvgPath: AppAssets.LockImage,
                  maxLength: 50,
                  obscure: true,
                  onChanged: _validateConfirmPassword,
                ),
              ),
              if (_showConfirmError)
                const Padding(
                  padding: EdgeInsets.only(top: 6),
                  child: Text(
                    "Password mismatch",
                    style: TextStyle(color: Colors.red, fontSize: 12),
                  ),
                ),
              Spacer(),
              Center(
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: AppButton(
                      text: Texts.Passwordrecovery,
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          MyRoutes.simpleNavbarScreen,
                        );
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
