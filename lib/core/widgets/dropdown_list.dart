import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:country_state_city_selector/country_state_city_selector.dart';

class DropDownList extends StatefulWidget {
  const DropDownList({super.key});

  @override
  State<DropDownList> createState() => _DropDownListState();
}

class _DropDownListState extends State<DropDownList> {
  String? selectedCountry;
  String? selectedState;
  String? selectedCity;

  // Controllers for custom text fields
  final TextEditingController countryController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// 🌍 Country Field
        _buildCustomDropdownField(
          hint: "Select Country",
          controller: countryController,
          onTap: () {
            _showPicker(context);
          },
        ),
        const SizedBox(height: 16),

        /// 🏙 State Field
        _buildCustomDropdownField(
          hint: "Select State",
          controller: stateController,
          onTap: selectedCountry == null
              ? () {}
              : () {
                  _showPicker(context);
                },
        ),
        const SizedBox(height: 16),

        /// 🏘 City Field
        _buildCustomDropdownField(
          hint: "Select City",
          controller: cityController,
          onTap: (selectedCountry == null || selectedState == null)
              ? () {}
              : () {
                  _showPicker(context);
                },
        ),
      ],
    );
  }

  Widget _buildCustomDropdownField({
    required String hint,
    required TextEditingController controller,
    required VoidCallback onTap,
  }) {
    return SizedBox(
      height: 50,
      width: 329,
      child: TextField(
        controller: controller,
        readOnly: true,
        onTap: onTap,
        decoration: InputDecoration(
          hintText: hint,
          suffixIcon: GestureDetector(
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: SvgPicture.asset(
                'assets/images/icons/drop_downarrow.svg',
                height: 20,
                width: 20,
              ),
            ),
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }

  void _showPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (ctx) {
        return SizedBox(
          height: 400,
          child: CountryStateCitySelector(
            // ✅ Fixed: New signature with 3 strings
            onSelectionChanged: (country, state, city) {
              setState(() {
                selectedCountry = country;
                selectedState = state;
                selectedCity = city;

                countryController.text = country;
                stateController.text = state;
                cityController.text = city;
              });
            },
          ),
        );
      },
    );
  }
}
