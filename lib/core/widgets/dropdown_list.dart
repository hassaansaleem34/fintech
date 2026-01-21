import 'package:flutter/material.dart';
import 'package:fintech/core/constants/colors.dart';

class DropDownList extends StatefulWidget {
  const DropDownList({
    super.key,
    required this.hintText,
    required this.items,
    this.suffixIcon,
    this.controller,
  });

  final String hintText;
  final List<String> items;
  final Widget? suffixIcon;
  final TextEditingController? controller;

  @override
  State<DropDownList> createState() => _DropDownListState();
}

class _DropDownListState extends State<DropDownList> {
  String? selectedValue;
  final GlobalKey _iconKey = GlobalKey();

  void _openDropdown() async {
    final RenderBox box =
        _iconKey.currentContext!.findRenderObject() as RenderBox;
    final Offset position = box.localToGlobal(Offset.zero);

    final value = await showMenu<String>(
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      elevation: 8,
      constraints: const BoxConstraints(
        maxHeight: 160, // ✅ ~3 items ke baad scroll
      ),
      position: RelativeRect.fromLTRB(
        position.dx,
        position.dy + box.size.height + 6,
        position.dx + box.size.width,
        0,
      ),
      items: widget.items
          .map((item) => PopupMenuItem<String>(value: item, child: Text(item)))
          .toList(),
    );

    if (value != null) {
      setState(() {
        selectedValue = value;
        widget.controller?.text = value;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 329,
      height: 50,
      child: TextField(
        controller: widget.controller,
        readOnly: true,
        decoration: InputDecoration(
          hintText: widget.hintText,
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
          suffixIcon: InkWell(
            key: _iconKey,
            onTap: _openDropdown,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: widget.suffixIcon,
            ),
          ),
        ),
      ),
    );
  }
}
