import 'package:flutter/material.dart';

class MultiSelectTextField extends StatefulWidget {
  const MultiSelectTextField({super.key});

  @override
  State<MultiSelectTextField> createState() => _MultiSelectTextFieldState();
}

class _MultiSelectTextFieldState extends State<MultiSelectTextField> {
  final List<String> items = ['₦ 5,000', '₦ 10,000'];
  List<String> selectedItems = [];

  void _openBottomSheet() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      isScrollControlled: true,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 12),
                const Text(
                  "Select Amount",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: "inter", // ✅ Inter font
                  ),
                ),
                const Divider(),
                SizedBox(
                  height: 300, // Fixed height for list
                  child: ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      final item = items[index];
                      final isSelected = selectedItems.contains(item);

                      return CheckboxListTile(
                        title: Text(
                          item,
                          style: const TextStyle(
                            fontFamily: "inter", // ✅ Inter font
                            fontSize: 16,
                          ),
                        ),
                        value: isSelected,
                        onChanged: (val) {
                          setModalState(() {
                            if (val == true) {
                              selectedItems.add(item);
                            } else {
                              selectedItems.remove(item);
                            }
                          });
                          setState(() {}); // update main UI
                        },
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text(
                      "Done",
                      style: TextStyle(
                        fontFamily: "inter", // ✅ Inter font
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: _openBottomSheet,
          child: Container(
            height: 52,
            width: 327,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    selectedItems.isEmpty
                        ? "Select Amount"
                        : "${selectedItems.length} selected",
                    style: const TextStyle(
                      fontSize: 16,
                      fontFamily: "inter", // ✅ Inter font
                    ),
                  ),
                ),
                const Icon(Icons.arrow_drop_down),
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
        Align(
          alignment: Alignment.centerRight,
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: selectedItems
                .map(
                  (item) => Chip(
                    label: Text(
                      item,
                      style: const TextStyle(
                        fontFamily: "inter", // ✅ Inter font
                      ),
                    ),
                    onDeleted: () {
                      setState(() {
                        selectedItems.remove(item);
                      });
                    },
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}
