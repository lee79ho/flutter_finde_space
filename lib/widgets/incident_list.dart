

import 'package:flutter/material.dart';
import 'package:freash_news/viewmodels/incident_view_model.dart';


class IncidentList extends StatelessWidget{

  final List<IncidentViewModel> incidents;

  IncidentList({required this.incidents});


  @override
  Widget build(BuildContext context){
    return ListView.builder(
      itemCount: incidents.length,
      itemBuilder: (context, index){
        final incident = incidents[index];
        return ListTile(
          leading: Image.network('http://192.168.0.4:3000${incident.imageURL}'),
          title: Text(incident.title)
        );
      },
    );
  }

}
