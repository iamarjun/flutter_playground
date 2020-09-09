import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/constants.dart';
import 'package:todoey/models/task_data.dart';

class AddNewTask extends StatelessWidget {
  final Function onPressed;
  const AddNewTask({Key key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String title;
    return Wrap(
      children: [
        Container(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          decoration: kContainerDecoration,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Add Task',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 40.0,
                    color: kPrimaryColor,
                  ),
                ),
                TextField(
                  autofocus: true,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    title = value;
                  },
                ),
                SizedBox(
                  height: 15.0,
                ),
                MaterialButton(
                  height: 50.0,
                  color: kPrimaryColor,
                  child: Text(
                    'Add Task',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () => onPressed(title),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
