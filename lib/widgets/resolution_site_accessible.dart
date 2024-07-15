import 'package:ebconnect_test/widgets/input_dropdown.dart';
import 'package:ebconnect_test/widgets/input_dropdown_item.dart';
import 'package:flutter/material.dart';

class ResolutionSiteAccessible extends StatelessWidget {
  const ResolutionSiteAccessible({
    super.key,
    required this.listSiteAccessible,
    required this.selectSiteAccessible,
    required this.onChanged,
  });

  final List<String> listSiteAccessible;
  final String selectSiteAccessible;
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
          ...listSiteAccessible.map(
            (item) {
              return DropdownMenuItem<String>(
                value: item,
                child: InputDropdownItem(value: item),
              );
            },
          ),
        ],
        labelText: 'Is Site Accessible',
        hintText: 'Is Site Accessible',
        selectedItem:
            selectSiteAccessible.isNotEmpty ? selectSiteAccessible : '',
        onChanged: onChanged,
      ),
    );
  }
}
