import 'package:ebconnect_test/widgets/input_primary.dart';
import 'package:flutter/material.dart';

class ResolutionActivityLog extends StatelessWidget {
  const ResolutionActivityLog({
    super.key,
    required this.logController,
    required this.onChanged,
  });

  final TextEditingController logController;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(vertical: 12),
      padding: const EdgeInsets.all(12),
      color: Colors.white,
      child: InputPrimary(
        controller: logController,
        labelText: 'Activity Log',
        hintText: 'Activity Log',
        maxLines: 10,
        keyboardType: TextInputType.multiline,
        validator: (value) => null,
        onChanged: onChanged,
      ),
    );
  }
}
