import 'package:flutter/material.dart';

class InputDropdownItem extends StatelessWidget {
  const InputDropdownItem({super.key, required this.value});

  final String value;

  @override
  Widget build(BuildContext context) {
    return Flex(
      crossAxisAlignment: CrossAxisAlignment.start,
      direction: Axis.vertical,
      children: [
        Expanded(
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(value, style: const TextStyle(color: Colors.black)),
          ),
        ),
        Divider(color: Colors.grey.shade300),
      ],
    );
  }
}
