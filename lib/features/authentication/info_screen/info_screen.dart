import 'package:fintech/core/constants/colors.dart';
import 'package:fintech/core/constants/image_string.dart';
import 'package:fintech/core/constants/string_text.dart';
import 'package:fintech/core/constants/text_style.dart';
import 'package:fintech/core/routes_screens/route_screens.dart';
import 'package:fintech/core/widgets/datepicker.dart';
import 'package:fintech/core/widgets/widgets_constant.dart';
import 'package:flutter/material.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({super.key});

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController dobController = TextEditingController();

  bool isButtonEnabled = false;
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      final formatted =
          "${picked.day.toString().padLeft(2, '0')}/"
          "${picked.month.toString().padLeft(2, '0')}/"
          "${picked.year}";
      dobController.text = formatted;
    }
  }

  void checkFields() {
    setState(() {
      isButtonEnabled =
          firstNameController.text.isNotEmpty &&
          lastNameController.text.isNotEmpty &&
          emailController.text.isNotEmpty &&
          dobController.text.isNotEmpty;
    });
  }

  @override
  void initState() {
    super.initState();

    // Add listeners to each field
    firstNameController.addListener(checkFields);
    lastNameController.addListener(checkFields);
    emailController.addListener(checkFields);
    dobController.addListener(checkFields);
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    dobController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20, top: 100),
        child: Column(
          children: [
            Row(
              children: [
                Text("Personal Details", style: TextOnStyle.phoneNumber),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text(
                  "Enter your details as they appear on your legal \ndocuments",
                  style: TextOnStyle.phoneNumberDes,
                ),
              ],
            ),
            SizedBox(height: 40),
            CustomTextField(
              hintText: "First name",
              svgPath: AppAssets.leadingpersonImage,
              keyboardType: TextInputType.text,
              maxLength: 11,
              controller: firstNameController,
            ),
            SizedBox(height: 20),
            CustomTextField(
              hintText: "Last name",
              svgPath: AppAssets.leadingpersonImage,
              keyboardType: TextInputType.text,
              maxLength: 11,
              controller: lastNameController,
            ),
            SizedBox(height: 20),
            CustomTextField(
              hintText: "Enter your Email",
              svgPath: AppAssets.emailImage,
              keyboardType: TextInputType.emailAddress,
              maxLength: 50,
              controller: emailController,
            ),
            SizedBox(height: 40),
            Row(
              children: [
                // SizedBox(width: 30),
                Text(
                  "Date of birth",
                  style: TextStyle(
                    fontSize: 16,
                    color: ColorsUse.primaryButtonColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                // SizedBox(width: 30),
                Text(
                  "DD/MM/YY",
                  style: TextStyle(
                    fontSize: 12,
                    color: ColorsUse.secondaryButtonColor,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Inter",
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            DatePicker(
              hintText: "DD/MM/YY",
              svgPath: AppAssets.calendarImage,
              controller: dobController,
              readOnly: true,
              onTap: () => _selectDate(context),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 20, bottom: 40),
              child: AppButton(
                text: Texts.countinueButton,
                onPressed: isButtonEnabled
                    ? () {
                        Navigator.pushNamed(context, MyRoutes.addressScreen);
                      }
                    : () {
                        // disabled state → kuch na ho
                      },
                backgroundColor: isButtonEnabled
                    ? ColorsUse.primaryButtonColor
                    : Colors.grey.shade400, // gray when disabled
              ),
            ),
          ],
        ),
      ),
    );
  }
}
