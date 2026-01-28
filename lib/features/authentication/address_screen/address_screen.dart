import 'package:fintech/core/constants/colors.dart';
import 'package:fintech/core/constants/image_string.dart';
import 'package:fintech/core/constants/string_text.dart';
import 'package:fintech/core/constants/text_style.dart';
import 'package:fintech/core/routes_screens/route_screens.dart';
import 'package:fintech/core/widgets/widgets_constant.dart';
import 'package:fintech/core/widgets/dropdown_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  final TextEditingController accountController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController address1Controller = TextEditingController();
  final TextEditingController address2Controller = TextEditingController();
  final TextEditingController postalController = TextEditingController();

  bool isFormValid = false;

  // Track which fields are empty for error messages
  bool showAccountError = false;
  bool showCityError = false;
  bool showAddress1Error = false;
  bool showAddress2Error = false;
  bool showPostalError = false;

  void checkFields() {
    setState(() {
      showAccountError = accountController.text.isEmpty;
      showCityError = cityController.text.isEmpty;
      showAddress1Error = address1Controller.text.isEmpty;
      showAddress2Error = address2Controller.text.isEmpty;
      showPostalError = postalController.text.isEmpty;

      isFormValid =
          !showAccountError &&
          !showCityError &&
          !showAddress1Error &&
          !showAddress2Error &&
          !showPostalError;
    });
  }

  @override
  void initState() {
    super.initState();
    accountController.addListener(checkFields);
    cityController.addListener(checkFields);
    address1Controller.addListener(checkFields);
    address2Controller.addListener(checkFields);
    postalController.addListener(checkFields);
  }

  @override
  void dispose() {
    accountController.dispose();
    cityController.dispose();
    address1Controller.dispose();
    address2Controller.dispose();
    postalController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: SvgPicture.asset(AppAssets.backImage),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, top: 30, right: 30),
        child: Column(
          children: [
            Row(
              children: [Text("Home Address", style: TextOnStyle.phoneNumber)],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Text(
                  "We take your privacy seriously, your \ninformation is never shown to other users",
                  style: TextOnStyle.phoneNumberDes,
                ),
              ],
            ),
            const SizedBox(height: 40),

            DropDownList(
              hintText: "State",
              controller: accountController,
              items: ["Punjab", "Sindh", "Baloch"],
              suffixIcon: SvgPicture.asset(AppAssets.dropDownImage),
            ),
            if (showAccountError)
              const Padding(
                padding: EdgeInsets.only(top: 4),
                child: Text(
                  "Please enter State",
                  style: TextStyle(color: Colors.red, fontSize: 12),
                ),
              ),
            const SizedBox(height: 20),

            DropDownList(
              hintText: "City",
              controller: cityController,
              items: ["Lhr", "Skp", "Khi"],
              suffixIcon: SvgPicture.asset(AppAssets.dropDownImage),
            ),
            if (showCityError)
              const Padding(
                padding: EdgeInsets.only(top: 4),
                child: Text(
                  "Please enter City",
                  style: TextStyle(color: Colors.red, fontSize: 12),
                ),
              ),
            const SizedBox(height: 20),

            CustomHintTextField(
              hintText: "Address Line 1",
              controller: address1Controller,
              errorText: showAddress1Error
                  ? "Please enter Address Line 1"
                  : null,
            ),
            const SizedBox(height: 20),

            CustomHintTextField(
              hintText: "Address Line 2",
              controller: address2Controller,
              errorText: showAddress2Error
                  ? "Please enter Address Line 2"
                  : null,
            ),
            const SizedBox(height: 20),

            CustomHintTextField(
              hintText: "Postal code",
              controller: postalController,
              errorText: showPostalError ? "Please enter Postal code" : null,
            ),
            const Spacer(),

            Center(
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: AppButton(
                    text: Texts.countinueButton,
                    onPressed: () {
                      checkFields(); // update errors before navigation
                      if (isFormValid) {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          MyRoutes.signInScreen,
                          (Route<dynamic> route) => false,
                        );
                      }
                    },
                    backgroundColor:
                        ColorsUse.primaryButtonColor, // always blue
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
