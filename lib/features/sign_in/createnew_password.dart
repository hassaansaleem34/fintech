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
  bool _isFormValid = false;

  void _checkForm() {
    final password = _passwordController.text;
    final confirm = _confirmController.text;

    setState(() {
      _showPasswordError = password.length < 6;
      _showConfirmError = confirm != password;
      _isFormValid = password.length >= 6 && confirm == password;
    });
  }

  @override
  void initState() {
    super.initState();
    _passwordController.addListener(_checkForm);
    _confirmController.addListener(_checkForm);
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmController.dispose();
    super.dispose();
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
                  const SizedBox(width: 18),
                  Text("Enter new password", style: TextOnStyle.signIntyle),
                ],
              ),
              const SizedBox(height: 10),
              Center(
                child: PasswordChangeTextField(
                  controller: _passwordController,
                  hintText: "",
                  suffixSvgPath: AppAssets.lockImage,
                  maxLength: 50,
                  obscure: true,
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
                  const SizedBox(width: 20),
                  Text("Confirm new password", style: TextOnStyle.signIntyle),
                ],
              ),
              const SizedBox(height: 10),
              Center(
                child: PasswordChangeTextField(
                  controller: _confirmController,
                  hintText: "",
                  suffixSvgPath: AppAssets.lockImage,
                  maxLength: 50,
                  obscure: true,
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

              const Spacer(),

              Center(
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: AppButton(
                      text: Texts.Passwordrecovery,
                      onPressed: () {
                        if (_isFormValid) {
                          Navigator.pushNamed(context, MyRoutes.signInScreen);
                        }
                      },
                      backgroundColor:
                          ColorsUse.primaryButtonColor, 
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
