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
              'Please enter 11 digits ',
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
  final String? svgPath;
  final bool obscure;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final int? maxLength;
  final bool isEmail;

  const CustomTextField({
    super.key,
    required this.hintText,
    this.svgPath,
    this.obscure = false,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.maxLength,
    this.isEmail = false,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late TextEditingController _controller;
  bool isFilled = false;
  bool isValidEmail = true;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();

    _controller.addListener(() {
      setState(() {
        isFilled = _controller.text.isNotEmpty;

        if (widget.isEmail) {
          isValidEmail = RegExp(
            r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
          ).hasMatch(_controller.text);
        } else {
          isValidEmail = true;
        }
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
      padding: const EdgeInsets.only(right: 20),
      child: Center(
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
              hintStyle: TextStyle(
                color: isValidEmail ? Colors.grey : Colors.red,
              ),
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
                borderSide: BorderSide(
                  color: isValidEmail ? Colors.grey : Colors.red,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: isValidEmail ? Colors.blue : Colors.red,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomHintTextField extends StatelessWidget {
  final String hintText;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final bool obscure;
  final TextInputType keyboardType;
  final String? errorText; // optional error

  const CustomHintTextField({
    super.key,
    required this.hintText,
    this.suffixIcon,
    this.controller,
    this.obscure = false,
    this.keyboardType = TextInputType.text,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 329,
          height: 50, // ✅ fixed height
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
                borderSide: BorderSide(
                  color: errorText == null ? Colors.grey : Colors.red,
                  width: 1,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: errorText == null ? Colors.grey : Colors.red,
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: errorText == null
                      ? ColorsUse.primaryButtonColor
                      : Colors.red,
                  width: 1,
                ),
              ),
              suffixIcon: suffixIcon != null
                  ? Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: suffixIcon,
                    )
                  : null,
              errorText: null, // ❌ remove from here
            ),
          ),
        ),
        // ✅ show error text manually below, but height of TextField fixed
        if (errorText != null)
          Padding(
            padding: const EdgeInsets.only(top: 4, left: 4),
            child: Text(
              errorText!,
              style: const TextStyle(color: Colors.red, fontSize: 12),
            ),
          ),
      ],
    );
  }
}

//sign in screen
class SignInTextField extends StatefulWidget {
  final String hintText;
  final String? svgPath;
  final bool obscure;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final int? maxLength;
  final String? suffixSvgPath;
  final bool isEmail; // 👈 optional email validation

  const SignInTextField({
    super.key,
    required this.hintText,
    this.svgPath,
    this.obscure = false,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.maxLength,
    this.suffixSvgPath,
    this.isEmail = false, // default false
  });

  @override
  State<SignInTextField> createState() => _SignInTextFieldState();
}

class _SignInTextFieldState extends State<SignInTextField> {
  late TextEditingController _controller;
  bool isFilled = false;
  late bool _obscureText;
  bool isValidEmail = true; 

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    _obscureText = widget.obscure;

    _controller.addListener(() {
      setState(() {
        isFilled = _controller.text.isNotEmpty;

        if (widget.isEmail) {
          // simple email regex validation
          isValidEmail = RegExp(
            r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
          ).hasMatch(_controller.text);
        } else {
          isValidEmail = true; // ignore if not email
        }
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
    return Column(
      children: [
        SizedBox(
          height: 52,
          width: 327,
          child: TextField(
            controller: _controller,
            obscureText: _obscureText,
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
              suffixIcon: widget.obscure
                  ? GestureDetector(
                      onTap: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: SvgPicture.asset(
                          "assets/images/icons/hide_1.svg",
                          width: 24,
                          height: 24,
                          colorFilter: ColorFilter.mode(
                            _obscureText ? Colors.grey : Colors.orange,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    )
                  : (widget.suffixSvgPath != null
                        ? Padding(
                            padding: const EdgeInsets.all(12),
                            child: SvgPicture.asset(
                              widget.suffixSvgPath!,
                              width: 24,
                              height: 24,
                              colorFilter: const ColorFilter.mode(
                                Colors.grey,
                                BlendMode.srcIn,
                              ),
                            ),
                          )
                        : null),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(
                  color: isValidEmail ? Colors.grey : Colors.red,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(
                  color: isValidEmail ? Colors.blue : Colors.red,
                ),
              ),
            ),
          ),
        ),
        // Optional helper/error text
        if (widget.isEmail && !isValidEmail)
          Padding(
            padding: const EdgeInsets.only(top: 4, left: 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Invalid email address",
                style: TextStyle(color: Colors.red, fontSize: 12),
              ),
            ),
          ),
      ],
    );
  }
}

//password
class PasswordChangeTextField extends StatefulWidget {
  final String hintText;
  final bool obscure;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final int? maxLength;
  final String? suffixSvgPath;
  final ValueChanged<String>? onChanged;

  const PasswordChangeTextField({
    super.key,
    required this.hintText,
    this.obscure = false,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.maxLength,
    this.suffixSvgPath,
    this.onChanged,
  });

  @override
  State<PasswordChangeTextField> createState() =>
      _PasswordChangeTextFieldState();
}

class _PasswordChangeTextFieldState extends State<PasswordChangeTextField> {
  late TextEditingController _controller;
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    _obscureText = widget.obscure;
  }

  @override
  void dispose() {
    if (widget.controller == null) _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      width: 327,
      child: TextField(
        controller: _controller,
        obscureText: _obscureText,
        keyboardType: widget.keyboardType,
        onChanged: widget.onChanged,
        maxLength: widget.maxLength,
        inputFormatters: widget.keyboardType == TextInputType.number
            ? [FilteringTextInputFormatter.digitsOnly]
            : null,
        decoration: InputDecoration(
          hintText: widget.hintText,
          counterText: "",
          suffixIcon: widget.obscure
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: SvgPicture.asset(
                      "assets/images/icons/hide_1.svg",
                      width: 24,
                      height: 24,
                      colorFilter: ColorFilter.mode(
                        _obscureText ? Colors.grey : Colors.orange,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                )
              : (widget.suffixSvgPath != null
                    ? Padding(
                        padding: const EdgeInsets.all(12),
                        child: SvgPicture.asset(
                          widget.suffixSvgPath!,
                          width: 24,
                          height: 24,
                          colorFilter: const ColorFilter.mode(
                            Colors.grey,
                            BlendMode.srcIn,
                          ),
                        ),
                      )
                    : null),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: Colors.blue),
          ),
        ),
      ),
    );
  }
}
