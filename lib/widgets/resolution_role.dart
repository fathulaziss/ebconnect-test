import 'package:ebconnect_test/widgets/input_dropdown.dart';
import 'package:ebconnect_test/widgets/input_dropdown_item.dart';
import 'package:flutter/material.dart';

class ResolutionRole extends StatelessWidget {
  const ResolutionRole({
    super.key,
    required this.roles,
    required this.selectRole,
    required this.onChanged,
  });

  final List<String> roles;
  final String selectRole;
  final Function(Object?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(vertical: 12),
      padding: const EdgeInsets.all(12),
      color: Colors.white,
      child: InputDropdown(
        items: [
          ...roles.map(
            (item) {
              return DropdownMenuItem<String>(
                value: item,
                child: InputDropdownItem(value: item),
              );
            },
          ),
        ],
        labelText: 'Role',
        hintText: 'Role',
        selectedItem: selectRole.isNotEmpty ? selectRole : '',
        onChanged: onChanged,
      ),
    );
  }
}
