import 'package:flutter/material.dart';
import 'package:todo/todo_1/todoapp.dart';

import 'datepicker/datepicker.dart';
import 'myhome.dart';
void main()
{
  runApp(TodoApp());
}
class TodoApp extends StatelessWidget {
  const TodoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        //PrimarySwatch:Colors.green
      ),
      home:Date(),
    );
  }
}
