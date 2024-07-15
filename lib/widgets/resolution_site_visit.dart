import 'package:ebconnect_test/widgets/input_dropdown.dart';
import 'package:ebconnect_test/widgets/input_dropdown_item.dart';
import 'package:flutter/material.dart';

class ResolutionSiteVisit extends StatelessWidget {
  const ResolutionSiteVisit({
    super.key,
    required this.listSiteVisitPurpose,
    required this.selectSiteVisitPurpose,
    required this.onChanged,
  });

  final List<String> listSiteVisitPurpose;
  final String selectSiteVisitPurpose;
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
          ...listSiteVisitPurpose.map(
            (item) {
              return DropdownMenuItem<String>(
                value: item,
                child: InputDropdownItem(value: item),
              );
            },
          ),
        ],
        labelText: 'Site Visit Purpose',
        hintText: 'Site Visit Purpose',
        selectedItem:
            selectSiteVisitPurpose.isNotEmpty ? selectSiteVisitPurpose : '',
        onChanged: onChanged,
      ),
    );
  }
}
