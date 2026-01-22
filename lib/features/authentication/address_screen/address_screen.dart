import 'package:fintech/core/constants/colors.dart';
import 'package:fintech/core/constants/image_string.dart';
import 'package:fintech/core/constants/string_text.dart';
import 'package:fintech/core/constants/text_style.dart';
import 'package:fintech/core/routes_screens/route_screens.dart';
import 'package:fintech/core/widgets/widgets_constant.dart';
import 'package:fintech/core/widgets/dropdown_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20, top: 100, right: 30),
        child: Column(
          children: [
            Row(
              children: [Text("Home Address", style: TextOnStyle.phoneNumber)],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text(
                  "We take your privacy seriously, your \ninformation is never shown to other users",

                  style: TextOnStyle.phoneNumberDes,
                ),
                SizedBox(height: 10),
              ],
            ),
            SizedBox(height: 80),
            // Simple hint text field without suffix icon
            DropDownList(
              hintText: "State",
              suffixIcon: SvgPicture.asset(
                AppAssets.dropDownImage,
                width: 2,
                height: 2,
              ),
              items: ['Punjab', 'Sindh', 'Bloach'],
              controller: TextEditingController(),
            ),
            SizedBox(height: 20),

            DropDownList(
              hintText: "City",
              suffixIcon: SvgPicture.asset(AppAssets.dropDownImage),
              items: ['Lhr', 'Skp', 'Khi', 'sialkot', 'frq'],
              controller: TextEditingController(),
            ),
            SizedBox(height: 20),

            CustomHintTextField(hintText: "Adress Line 1"),
            SizedBox(height: 20),

            CustomHintTextField(hintText: "Adress Line 2"),

            SizedBox(height: 20),

            CustomHintTextField(hintText: "Postal code"),
            const Spacer(),
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
          ],
        ),
      ),
    );
  }
}
