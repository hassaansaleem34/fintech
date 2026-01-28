import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fintech/core/constants/colors.dart'; // For ColorsUse.secondaryButtonColor

class DatePicker extends StatelessWidget {
  final String hintText;
  final String? svgPath;
  final TextEditingController? controller;
  final VoidCallback? onTap;
  final bool readOnly;
  final double width;
  final double height;
  final double borderRadius;
  final Color borderColor;

  const DatePicker({
    super.key,
    required this.hintText,
    this.svgPath,
    this.controller,
    this.onTap,
    this.readOnly = true,
    this.width = 329, // Default width
    this.height = 49, // Default height
    this.borderRadius = 8.0,
    this.borderColor = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Center(
        child: SizedBox(
          width: width,
          height: height,
          child: TextField(
            controller: controller,
            readOnly: readOnly,
            onTap: () async {
              // Custom Theme for DatePicker
              final ThemeData customTheme = Theme.of(context).copyWith(
                colorScheme: ColorScheme.light(
                  primary: ColorsUse.onBoardContainer, // Header & selected date
                  onPrimary: Colors.white, // Selected date text
                  onSurface: Colors.black, // Default text
                ),
                textButtonTheme: TextButtonThemeData(
                  style: TextButton.styleFrom(
                    foregroundColor: ColorsUse.onBoardContainer, // OK & Cancel
                  ),
                ),
              );

              DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
                builder: (context, child) {
                  return Theme(data: customTheme, child: child!);
                },
              );

              // Fill controller automatically
              if (pickedDate != null && controller != null) {
                controller!.text =
                    "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
              }

              // Call additional onTap logic
              if (onTap != null) onTap!();
            },
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                vertical: 14,
                horizontal: 12,
              ),
              hintText: hintText,
              prefixIcon: svgPath != null
                  ? Padding(
                      padding: const EdgeInsets.all(12),
                      child: SvgPicture.asset(svgPath!),
                    )
                  : null,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                borderSide: BorderSide(color: borderColor, width: 1.5),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                borderSide: BorderSide(color: borderColor, width: 1.5),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                borderSide: BorderSide(
                  color: Colors.blue, // Focused border color
                  width: 2,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
