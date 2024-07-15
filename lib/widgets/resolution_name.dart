import 'package:ebconnect_test/widgets/input_primary.dart';
import 'package:flutter/material.dart';

class ResolutionName extends StatelessWidget {
  const ResolutionName({
    super.key,
    required this.nameController,
    required this.onChanged,
  });

  final TextEditingController nameController;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(vertical: 12),
      padding: const EdgeInsets.all(12),
      color: Colors.white,
      child: InputPrimary(
        controller: nameController,
        labelText: 'Nama',
        hintText: 'Nama',
        validator: (value) => null,
        onChanged: onChanged,
      ),
    );
  }
}
