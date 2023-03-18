import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/utils/app_layout.dart';
import 'package:newsapp/utils/app_style.dart';

const List<String> list = <String>['One', 'Two', 'Three', 'Four'];

class DropDown extends StatefulWidget {
  const DropDown({super.key});

  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  @override
  Widget build(BuildContext context) {
    String dropdownValue = list.first;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(5)),
      height: 30,
      width: 200,
      decoration: BoxDecoration(
        border: Border.all(color: Style.menuColors),
        borderRadius: BorderRadius.circular(5),
      ),
      child: DropdownButton<String>(
        value: dropdownValue,
        icon: const Icon(Icons.arrow_drop_down_outlined),
        elevation: 16,
        underline: SizedBox(),
        style: const TextStyle(color: Colors.deepPurple),
        isExpanded: true,
        onChanged: (String? value) {
          setState(
            () {
              dropdownValue = value!;
            },
          );
        },
        items: list.map<DropdownMenuItem<String>>(
          (String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          },
        ).toList(),
      ),
    );
  }
}
