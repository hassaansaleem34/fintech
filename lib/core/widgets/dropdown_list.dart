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
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;
  String? selectedValue;

  void _toggleDropdown() {
    if (_overlayEntry == null) {
      _showDropdown();
    } else {
      _removeDropdown();
    }
  }

  void _showDropdown() {
    final overlay = Overlay.of(context);

    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        width: _getFieldWidth(),
        child: CompositedTransformFollower(
          link: _layerLink,
          offset: const Offset(0, 52), // field height + gap
          showWhenUnlinked: false,
          child: Material(
            elevation: 8,
            borderRadius: BorderRadius.circular(12),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 180),
              child: ListView(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                children: widget.items.map((item) {
                  return InkWell(
                    onTap: () {
                      widget.controller?.text = item;
                      selectedValue = item;
                      _removeDropdown();
                      setState(() {});
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 12,
                      ),
                      child: Text(item),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ),
      ),
    );

    overlay.insert(_overlayEntry!);
  }

  void _removeDropdown() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  double _getFieldWidth() {
    final renderBox = context.findRenderObject() as RenderBox;
    return renderBox.size.width;
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: SizedBox(
        width: 329,
        height: 50,
        child: TextField(
          controller: widget.controller,
          readOnly: true,
          onTap: _toggleDropdown,
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
              onTap: _toggleDropdown,
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: widget.suffixIcon,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
