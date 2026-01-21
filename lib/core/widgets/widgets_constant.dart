import 'package:fintech/core/constants/colors.dart';
import 'package:fintech/core/constants/image_string.dart';
import 'package:fintech/core/constants/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

// ignore: depend_on_referenced_packages

import 'package:pinput/pinput.dart';

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final double width;
  final double height;
  final double radius;
  final bool isLoading;

  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.backgroundColor,
    this.textColor = Colors.white,
    this.width = 327,
    this.height = 44,
    this.radius = 30,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
        child: isLoading
            ? const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Colors.white,
                ),
              )
            : Text(
                text,
                style: TextStyle(
                  color: ColorsUse.buttonTextColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
      ),
    );
  }
}

class MyTextField extends StatefulWidget {
  final String text;
  final bool obscure;
  final TextEditingController controller;

  const MyTextField({
    super.key,
    required this.text,
    required this.obscure,
    required this.controller,
  });

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  bool isValid = false;
  bool isFocused = false;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    widget.controller.addListener(() {
      setState(() {
        isValid = widget.controller.text.length == 11;
      });
    });

    _focusNode.addListener(() {
      setState(() {
        isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: SizedBox(
            height: 49,
            width: 350,
            child: Stack(
              children: [
                Positioned(
                  left: 49,
                  top: 0,
                  child: Text(widget.text, style: TextOnStyle.hintText),
                ),
                TextField(
                  focusNode: _focusNode, // ✅ focus detect
                  controller: widget.controller,
                  obscureText: widget.obscure,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(11),
                  ],
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(
                      left: 15,
                      right: 14,
                      top: 20,
                      bottom: 0,
                    ),
                    prefixIcon: SvgPicture.asset(AppAssets.personImage),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.cancel, color: Colors.red),
                      onPressed: () {
                        widget.controller.clear();
                      },
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.black12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        // ✅ Helper text sirf focus par show hoga
        if (isFocused)
          Padding(
            padding: const EdgeInsets.only(right: 60),
            child: Text(
              'Helper text for status and guidance',
              style: TextStyle(
                color: isValid ? Colors.green : Colors.red,
                fontSize: 12,
              ),
            ),
          ),
      ],
    );
  }
}

class OTPInputField extends StatelessWidget {
  final int length;
  final Function(String) onCompleted;
  final Function(String) onChanged;

  OTPInputField({
    required this.length,
    required this.onCompleted,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 50,
      height: 60,
      textStyle: TextStyle(
        fontSize: 20,
        color: Colors.white,
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        color: ColorsUse.primaryButtonColor,
        borderRadius: BorderRadius.circular(8),
      ),
    );

    return Pinput(
      length: length,
      defaultPinTheme: defaultPinTheme,
      onChanged: onChanged,
      onCompleted: onCompleted,
      showCursor: true, // cursor visible
      focusedPinTheme: defaultPinTheme.copyWith(
        decoration: BoxDecoration(
          color: Colors.blue.shade700, // darker blue on focus
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      keyboardType: TextInputType.number, // 🔢 Numeric keyboard
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly, // only digits allowed
      ],
    );
  }
}

class CustomTextField extends StatefulWidget {
  final String hintText;
  final String? svgPath; // 👈 SVG path instead of Widget
  final bool obscure;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final int? maxLength;

  const CustomTextField({
    super.key,
    required this.hintText,
    this.svgPath,
    this.obscure = false,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.maxLength,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late TextEditingController _controller;
  bool isFilled = false;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    _controller.addListener(() {
      setState(() {
        isFilled = _controller.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    if (widget.controller == null) _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 60),
      child: SizedBox(
        height: 49,
        width: 329,
        child: TextField(
          controller: _controller,
          obscureText: widget.obscure,
          keyboardType: widget.keyboardType,
          maxLength: widget.maxLength,
          inputFormatters: widget.keyboardType == TextInputType.number
              ? [FilteringTextInputFormatter.digitsOnly]
              : null,
          decoration: InputDecoration(
            hintText: widget.hintText,
            counterText: "",
            prefixIcon: widget.svgPath == null
                ? null
                : Padding(
                    padding: const EdgeInsets.all(12),
                    child: SvgPicture.asset(
                      widget.svgPath!,

                      fit: BoxFit.contain,
                      colorFilter: ColorFilter.mode(
                        isFilled ? Colors.blue : Colors.grey,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 15,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.blue),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomHintTextField extends StatelessWidget {
  final String hintText;
  final Widget? suffixIcon; // optional, dropdown arrow ya koi icon
  final TextEditingController? controller;
  final bool obscure;
  final TextInputType keyboardType;

  const CustomHintTextField({
    super.key,
    required this.hintText,
    this.suffixIcon,
    this.controller,
    this.obscure = false,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 329,
      height: 50,
      child: TextField(
        controller: controller,
        obscureText: obscure,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey.shade600),
          contentPadding: const EdgeInsets.fromLTRB(12, 8, 8, 8),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.grey, width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Colors.grey, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: ColorsUse.primaryButtonColor,
              width: 1,
            ),
          ),
          suffixIcon: suffixIcon != null
              ? Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: suffixIcon,
                )
              : null,
        ),
      ),
    );
  }
}
