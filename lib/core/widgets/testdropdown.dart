// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:state_city_pro/state_city_pro.dart';

// class DropDownList extends StatefulWidget {
//   const DropDownList({super.key});

//   @override
//   State<DropDownList> createState() => _DropDownListState();
// }

// class _DropDownListState extends State<DropDownList> {
//   // Controllers for each field
//   final TextEditingController stateController = TextEditingController();
//   final TextEditingController cityController = TextEditingController();

//   // Optional variables to display selected values
//   String? selectedCountry;
//   String? selectedState;
//   String? selectedCity;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         /// 🌍 Country Field
//         _buildCustomDropdownField(
//           hint: "Select Country",
//           controller:
//               stateController, // state_city_pro package handles country internally
//           onTap: () {
//             _showPicker(context);
//           },
//         ),
//         const SizedBox(height: 16),

//         /// 🏙 State Field
//         _buildCustomDropdownField(
//           hint: "Select State",
//           controller: stateController,
//           onTap: stateController.text.isEmpty
//               ? () {}
//               : () {
//                   _showPicker(context);
//                 },
//         ),
//         const SizedBox(height: 16),

//         /// 🏘 City Field
//         _buildCustomDropdownField(
//           hint: "Select City",
//           controller: cityController,
//           onTap: (stateController.text.isEmpty)
//               ? () {}
//               : () {
//                   _showPicker(context);
//                 },
//         ),
//         const SizedBox(height: 20),

//         /// Display selected values
//         Text("Selected State: ${stateController.text}"),
//         Text("Selected City: ${cityController.text}"),
//       ],
//     );
//   }

//   Widget _buildCustomDropdownField({
//     required String hint,
//     required TextEditingController controller,
//     required VoidCallback onTap,
//   }) {
//     return SizedBox(
//       height: 50,
//       width: 340,
//       child: TextField(
//         controller: controller,
//         readOnly: true,
//         onTap: onTap,
//         decoration: InputDecoration(
//           hintText: hint,
//           suffixIcon: GestureDetector(
//             onTap: onTap,
//             child: Padding(
//               padding: const EdgeInsets.all(12),
//               child: SvgPicture.asset(
//                 'assets/images/icons/drop_downarrow.svg',
//                 height: 20,
//                 width: 20,
//               ),
//             ),
//           ),
//           border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
//         ),
//       ),
//     );
//   }

//   void _showPicker(BuildContext context) {
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       builder: (ctx) {
//         return SizedBox(
//           height: 400,
//           child: CountryStateCityPicker(
//             state: stateController,
//             city: cityController,
//             textFieldDecoration: InputDecoration(
//               fillColor: Colors.blueGrey.shade100,
//               filled: true,
//               suffixIcon: const Icon(Icons.arrow_downward_rounded),
//               border: const OutlineInputBorder(borderSide: BorderSide.none),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
