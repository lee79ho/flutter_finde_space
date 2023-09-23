
import 'package:freash_news/models/incident.dart';

class IncidentViewModel{
    final Incident incident;

    IncidentViewModel({required this.incident});

    String get title{
      return this.incident.title;
    }

    String get description{
      return this.incident.description;
    }



}