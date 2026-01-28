import 'package:fintech/core/constants/colors.dart';
import 'package:fintech/core/constants/image_string.dart';
import 'package:fintech/core/constants/string_text.dart';
import 'package:fintech/core/constants/text_style.dart';
import 'package:fintech/core/routes_screens/route_screens.dart';
import 'package:fintech/core/widgets/widgets_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
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
    final phoneNumber = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: SvgPicture.asset(AppAssets.backImage),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, top: 50, right: 30),
        child: Column(
          children: [
            Row(
              children: [
                Text("Verify Your Number", style: TextOnStyle.phoneNumber),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                SizedBox(width: 4),
                Text(
                  "Please enter the 6 digit code sent to the mobile \nnumber below",
                  style: TextOnStyle.phoneNumberDes,
                ),
              ],
            ),
            SizedBox(height: 40),
            Row(
              children: [Text(phoneNumber, style: TextOnStyle.phoneNumber)],
            ),
            SizedBox(height: 30),
            Row(
              children: [
                Text(
                  "Didn’t receive SMS?",
                  style: TextStyle(
                    color: ColorsUse.primaryButtonColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  "Resend Code",
                  style: TextStyle(
                    color: ColorsUse.secondaryButtonColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            SizedBox(height: 40),
            OTPInputField(
              length: 6,
              onCompleted: handleCompletedOTP,
              onChanged: handleChangedOTP,
            ),

            Padding(
              padding: const EdgeInsets.only(top: 330),
              child: AppButton(
                text: Texts.VerifyButton,
                onPressed: isButtonEnabled
                    ? () {
                        // print("OTP Verified: $otp");
                        Navigator.pushNamed(context, MyRoutes.infoScreen);
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
    );
  }
}
