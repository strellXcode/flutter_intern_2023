import 'package:flutter/material.dart';
class Todo extends StatefulWidget {
  const Todo({Key? key}) : super(key: key);

  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  var titleController = TextEditingController();
  var disController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  var title = "", dis = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TODO",
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold)
          ,
        ),
      ),
      body: Form(
          key: _formkey,
          child: Column(
        children: [
          Text("NEW PAGE"),
          Padding(
            padding: const EdgeInsets.all(30.0),
          child: TextFormField(
              validator: (value) {
                if (title == '') {
                  return "*Enter the Title*";
                }
                return null;
              },
              controller: titleController,

            decoration: InputDecoration(
                label: Text("TITLE "),
                border:OutlineInputBorder()
            ),
          ),
          ),

          SizedBox(
            width: 9000,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: TextFormField(
                validator: (value) {
                  if (dis == '') {
                    return "*Enter the Discription*";
                  }
                  return null;
                },
                controller: disController,

                decoration: InputDecoration(

                    label: Text("DISCRIPTION"),
                    border:OutlineInputBorder()
                ),
              ),
            ),
          ),
          ElevatedButton(onPressed: () {
            setState(() {
              title=titleController.text;
              dis=disController.text;
              if (_formkey.currentState!.validate()) {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("#SUCCESS#")));

              }

            });
          }, child: Text("Save"))

        ],
      )),
    );
  }
}
