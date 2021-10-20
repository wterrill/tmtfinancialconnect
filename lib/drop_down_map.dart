import 'package:flutter/material.dart';
import 'package:tmtfinancialconnect/buildStructure.dart';
import 'package:tmtfinancialconnect/configuration.dart';
import 'package:tmtfinancialconnect/post_page.dart';

class DropDownMap extends StatefulWidget {
  const DropDownMap({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  State<DropDownMap> createState() => _DropDownMapState();
}

class _DropDownMapState extends State<DropDownMap> {
  // String dropdownValue = 'Please Select';

  @override
  Widget build(BuildContext context) {
    int finalMap = finalStructure?.all![widget.index].map ?? 0;

    print(finalMap);
    print(finalMap.runtimeType);
    return DropdownButton<String>(
      value: itemArray[finalMap],
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
          print('&%&%&%&%&%&%&%&%');
          print(newValue);
          finalStructure?.all![widget.index].map =
              itemArray.indexOf(newValue as String);
        });
      },
      items: itemArray.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
