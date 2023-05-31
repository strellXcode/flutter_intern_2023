import 'package:flutter/material.dart';
class Date extends StatefulWidget {
  const Date({Key? key}) : super(key: key);

  @override
  State<Date> createState() => _DateState();
}

class _DateState extends State<Date> {
  var dateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DATE PICKER",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold)
        ),
      ),
       body:
      Column(
      children: [
        TextField(
          controller: dateController,
          decoration: const InputDecoration(
            icon:Icon(Icons.calendar_today),
            labelText: "Enter Date"
          ),
          readOnly: true,
          onTap: () async{

    }


        ),



      ],
       ),
    );
  }
}
