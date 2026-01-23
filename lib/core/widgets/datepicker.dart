import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
        child: Container(
          width: width,
          height: height,
          child: TextField(
            controller: controller,
            readOnly: readOnly,
            onTap: onTap,
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
                borderSide: const BorderSide(color: Colors.blue, width: 2),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
