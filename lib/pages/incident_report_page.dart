import 'package:flutter/material.dart';

class IncidentReportPage extends StatelessWidget {
  

  final ButtonStyle flatButtonStyle = TextButton.styleFrom(
    backgroundColor: Colors.grey,
    padding: EdgeInsets.all(0),
  );


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title:Text("Report an incient")

      ),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          TextField(
            decoration: InputDecoration(
              labelText: "enter title",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10)
                )
            ),
          ),

          TextField(
            textInputAction: TextInputAction.done,
            maxLines: null,
            keyboardType:TextInputType.multiline,
            decoration: InputDecoration(
              labelText: "Enter desciption"
            ),

          ),
         TextButton(
          style: flatButtonStyle,
          onPressed: () {},
          child: Text(
           "Save",
             style: TextStyle(color: Colors.white),
          ),
         )
        ]),
        )
    );
  }
}