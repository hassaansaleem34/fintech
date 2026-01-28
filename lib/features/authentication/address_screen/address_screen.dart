import 'package:fintech/core/constants/colors.dart';
import 'package:fintech/core/constants/image_string.dart';
import 'package:fintech/core/constants/string_text.dart';
import 'package:fintech/core/constants/text_style.dart';
import 'package:fintech/core/routes_screens/route_screens.dart';
import 'package:fintech/core/widgets/dropdown_list.dart';
import 'package:fintech/core/widgets/testdropdown.dart';
import 'package:fintech/core/widgets/widgets_constant.dart';

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
  final countryController = TextEditingController();
  final iscityController = TextEditingController();

  final stateController = TextEditingController();

  bool isFormValid = false;

  // Track which fields are empty for error messages

  bool showAddress1Error = false;
  bool showAddress2Error = false;
  bool showPostalError = false;

  void checkFields() {
    setState(() {
      showAddress1Error = address1Controller.text.isEmpty;
      showAddress2Error = address2Controller.text.isEmpty;
      showPostalError = postalController.text.isEmpty;

      isFormValid =
          !showAddress1Error && !showAddress2Error && !showPostalError;
    });
  }

  @override
  void initState() {
    super.initState();
    countryController.addListener(checkFields);
    cityController.addListener(checkFields);
    address1Controller.addListener(checkFields);
    address2Controller.addListener(checkFields);
    postalController.addListener(checkFields);
  }

  @override
  void dispose() {
    countryController.dispose();
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
            DropDownList(),
            const SizedBox(height: 20),
            //country
            // DropDownList(
            //   hintText: "Select Country",
            //   controller: countryController,
            //   pickerType: PickerType.country,

            //   suffixIcon: SvgPicture.asset(AppAssets.dropDownImage),
            // ),
            // if (showAccountError)
            //   const Padding(
            //     padding: EdgeInsets.only(right: 230),
            //     child: Text(
            //       "Please enter State",
            //       style: TextStyle(color: Colors.red, fontSize: 12),
            //     ),
            //   ),
            // const SizedBox(height: 20),
            // //state
            // DropDownList(
            //   hintText: "Select State",
            //   controller: stateController,
            //   pickerType: PickerType.state,

            //   suffixIcon: SvgPicture.asset(AppAssets.dropDownImage),
            // ),
            // if (showCityError)
            //   Padding(
            //     padding: const EdgeInsets.only(right: 230),
            //     child: Text(
            //       "Please enter City",
            //       style: TextStyle(color: Colors.red, fontSize: 12),
            //     ),
            //   ),
            // const SizedBox(height: 20),
            // const SizedBox(height: 12),
            // DropDownList(
            //   hintText: "Select City",
            //   controller: cityController,
            //   pickerType: PickerType.city,
            // ),
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
                      checkFields();
                      if (isFormValid) {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          MyRoutes.simpleNavbarScreen,
                          (Route<dynamic> route) => false,
                        );
                      }
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
