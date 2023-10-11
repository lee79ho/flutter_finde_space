


import 'package:flutter/material.dart';
import 'package:freash_news/models/incident.dart';
import 'package:freash_news/service/webservice.dart';

class ReportIncidentViewModel extends ChangeNotifier
{

  late String title;
  late String description;
  String? imagePath;





  Future<void> saveIncident() async {
    
    final incident = Incident(title: title, description: description, imageURL: imagePath!);
    await Webservice().saveIncident(incident);
    //TODO
    
  }



}