import 'package:ebconnect_test/widgets/input_primary.dart';
import 'package:flutter/material.dart';

class RestoreDescription extends StatelessWidget {
  const RestoreDescription({
    super.key,
    required this.descriptionController,
    required this.onChanged,
  });

  final TextEditingController descriptionController;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(vertical: 12),
      padding: const EdgeInsets.all(12),
      color: Colors.white,
      child: InputPrimary(
        controller: descriptionController,
        labelText: 'Description',
        hintText: 'Description',
        maxLines: 10,
        keyboardType: TextInputType.multiline,
        validator: (value) => null,
        onChanged: onChanged,
      ),
    );
  }
}
