import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class InputDropdown extends StatelessWidget {
  const InputDropdown({
    super.key,
    this.labelText,
    this.labelStyle,
    this.labelTextColor,
    this.hintText,
    required this.items,
    required this.selectedItem,
    this.onChanged,
    this.borderColor,
    this.textAlign,
  });

  final String? labelText;
  final TextStyle? labelStyle;
  final Color? labelTextColor;
  final String? hintText;
  final List<DropdownMenuItem<Object>> items;
  final String selectedItem;
  final Function(Object?)? onChanged;
  final Color? borderColor;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelText != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              labelText!,
              style: labelStyle ?? const TextStyle(color: Colors.black),
            ),
          ),
        Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.blueGrey[50],
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: Colors.grey.shade300,
            ),
          ),
          child: DropdownButton2(
            underline: const SizedBox(),
            dropdownStyleData: const DropdownStyleData(
              decoration: BoxDecoration(color: null),
            ),
            customButton: Row(
              children: [
                Expanded(
                  child: Text(
                    selectedItem.isNotEmpty
                        ? selectedItem
                        : hintText ?? 'Choose Item',
                    textAlign: textAlign ?? TextAlign.left,
                    style: TextStyle(
                      color: selectedItem.isNotEmpty
                          ? Colors.grey.shade900
                          : Colors.grey,
                    ),
                  ),
                ),
                const Icon(Icons.arrow_drop_down, color: Colors.deepPurple),
              ],
            ),
            items: items,
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}
