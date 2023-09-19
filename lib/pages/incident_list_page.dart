
import 'package:flutter/material.dart';
import 'package:freash_news/widgets/incident_list.dart';

class IncidentListPage extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Incients"),
        backgroundColor: Colors.green,
      ),
      body: IncidentList()
    )
  }
}