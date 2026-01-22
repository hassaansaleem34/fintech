import 'package:fintech/core/constants/colors.dart';
import 'package:fintech/core/constants/string_text.dart';
import 'package:fintech/core/constants/text_style.dart';
import 'package:fintech/core/routes_screens/route_screens.dart';
import 'package:fintech/core/widgets/widgets_constant.dart';
import 'package:flutter/material.dart';

class VerifyScreen extends StatefulWidget {
  const VerifyScreen({super.key});

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  bool isButtonEnabled = false; // initially disabled
  String otp = "";

  void handleCompletedOTP(String pin) {
    print("Completed OTP: $pin");
    setState(() {
      otp = pin;
      isButtonEnabled = pin.length == 6; // enable if OTP is 6 digits
    });
  }

  void handleChangedOTP(String pin) {
    print("Entered OTP: $pin");
    setState(() {
      otp = pin;
      isButtonEnabled = pin.length == 6; // update enable status
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, top: 60, right: 30),
          child: Column(
            children: [
              Row(
                children: [
                  Text(Texts.verifyItsYou, style: TextOnStyle.phoneNumber),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Text(Texts.sentCode, style: TextOnStyle.phoneNumberDes),
                ],
              ),
              SizedBox(height: 40),
              OTPInputField(
                length: 6,
                onCompleted: handleCompletedOTP,
                onChanged: handleChangedOTP,
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  SizedBox(width: 10),
                  Text(
                    "Resend Code",
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: "Lato",
                      fontWeight: FontWeight.w700,
                      color: ColorsUse.secondaryButtonColor,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 350),
                child: AppButton(
                  text: Texts.countinueButton,
                  onPressed: isButtonEnabled
                      ? () {
                          print("OTP Verified: $otp");
                          Navigator.pushNamed(context, MyRoutes.createPassword);
                        }
                      : () {},
                  backgroundColor: isButtonEnabled
                      ? ColorsUse.primaryButtonColor
                      : Colors.grey.shade400, // disabled if not complete
                  // gray when disabled
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
