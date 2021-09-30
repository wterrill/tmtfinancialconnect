import 'package:flutter/material.dart';

class DropDownMap extends StatefulWidget {
  const DropDownMap({Key? key, this.lastMap = 0}) : super(key: key);
  final int lastMap;

  @override
  State<DropDownMap> createState() => _DropDownMapState();
}

class _DropDownMapState extends State<DropDownMap> {
  String dropdownValue = 'Please Select';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(
        Icons.keyboard_arrow_down_rounded,
        color: Colors.red,
      ),
      iconSize: 24,
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items: <String>[
        'Please Select',
        'Revenue',
        'Cost of Goods Sold',
        'Labor',
        'Operating Expenses',
        'Other Income'
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
