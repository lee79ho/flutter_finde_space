

import 'package:freash_news/models/incident.dart';
import 'package:freash_news/service/webservice.dart';
import 'package:freash_news/viewmodels/incident_view_model.dart';

class IncidentListViewModel{

  List<IncidentViewModel> incidents = <IncidentViewModel>[];



  Function<void> getAllIncidents() async{

    final results = await Webservice().getAllIncidents();
    incidents = results.map((incident) => IncidentViewModel(incident: incident)).toList();
    notifyListeners();

  }

}