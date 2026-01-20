import 'package:fintech/core/constants/text_style.dart';
import 'package:fintech/core/widgets/widgets_constant.dart';
import 'package:flutter/material.dart';

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
            SizedBox(height: 20),
            // Simple hint text field without suffix icon
            CustomHintTextField(
              hintText: "State",
              suffixIcon: Icon(Icons.arrow_drop_down, color: Colors.grey),
            ),
            SizedBox(height: 20),

            CustomHintTextField(
              hintText: "City",
              suffixIcon: Icon(Icons.arrow_drop_down, color: Colors.grey),
            ),
            SizedBox(height: 20),

            CustomHintTextField(hintText: "Adress Line 1"),
            SizedBox(height: 20),

            CustomHintTextField(hintText: "Adress Line 2"),

            SizedBox(height: 20),

            CustomHintTextField(hintText: "Postal code"),
          ],
        ),
      ),
    );
  }
}
