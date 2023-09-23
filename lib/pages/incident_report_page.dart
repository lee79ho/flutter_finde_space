import 'package:flutter/material.dart';
import 'package:freash_news/viewmodels/report_incident_view_model.dart';
import 'package:provider/provider.dart';

class IncidentReportPage extends StatelessWidget {
  

  final ButtonStyle flatButtonStyle = TextButton.styleFrom(
    backgroundColor: Colors.grey,
    padding: EdgeInsets.all(0),
  );


  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<ReportIncidentViewModel>(context);
    

    return Scaffold(
      appBar: AppBar(
        title:Text("Report an incient")

      ),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          TextField(
            onChanged: (value) => vm.title = value,

            decoration: InputDecoration(
              labelText: "enter title",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10)
                )
            ),
          ),

          TextField(
            onChanged: (value) => vm.description = value,
            textInputAction: TextInputAction.done,
            maxLines: null,
            keyboardType:TextInputType.multiline,
            decoration: InputDecoration(
              labelText: "Enter desciption"
            ),

          ),
         TextButton(
          style: flatButtonStyle,
          onPressed: () {
            vm.saveIncident();
            Navigator.pop(context);
          },
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