

import 'package:flutter/material.dart';
import 'package:freash_news/service/webservice.dart';
import 'package:freash_news/viewmodels/incident_view_model.dart';

class IncidentListViewModel extends ChangeNotifier{

  List<IncidentViewModel> incidents = <IncidentViewModel>[];



  Future<void>  getAllIncidents() async{

    final results = await Webservice().getAllIncidents();
    incidents = results.map((incident) => IncidentViewModel(incident: incident)).toList();
    notifyListeners();

  }

}