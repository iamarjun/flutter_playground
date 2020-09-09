import 'package:flutter/material.dart';
import 'package:todoey/constants.dart';

class TaskTile extends StatelessWidget {
  final String name;
  final bool isChecked;
  final Function toggleCheckbox;
  final Function onDelete;
  const TaskTile({
    Key key,
    this.name,
    this.isChecked,
    this.toggleCheckbox,
    this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child: GestureDetector(
        onLongPress: onDelete,
        child: CheckboxListTile(
          activeColor: kPrimaryColor,
          title: Text(
            name,
            style: TextStyle(
              decoration: isChecked ? TextDecoration.lineThrough : null,
            ),
          ),
          value: isChecked,
          onChanged: toggleCheckbox,
        ),
      ),
    );
  }
}
