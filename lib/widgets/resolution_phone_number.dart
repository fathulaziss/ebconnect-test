import 'package:ebconnect_test/widgets/input_primary.dart';
import 'package:flutter/material.dart';

class ResolutionPhoneNumber extends StatelessWidget {
  const ResolutionPhoneNumber({
    super.key,
    required this.phoneNumberController,
    required this.onChanged,
  });

  final TextEditingController phoneNumberController;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(vertical: 12),
      padding: const EdgeInsets.all(12),
      color: Colors.white,
      child: InputPrimary(
        controller: phoneNumberController,
        labelText: 'No. Telepon',
        hintText: 'No. Telepon',
        validator: (value) => null,
        onChanged: onChanged,
      ),
    );
  }
}
