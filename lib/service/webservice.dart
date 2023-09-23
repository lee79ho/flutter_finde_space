

import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:freash_news/models/incident.dart';

class Webservice {
  Future<void> saveIncident(Incident incident) async {
    log(incident.title);
    log(incident.description);
    final url = "http://192.168.0.4:3000/incidentsNoImage";
    await Dio().post(
      url,
      data: {"title": incident.title, "description": incident.description},
      options: Options(contentType: "application/x-www-form-urlencoded")
    );
  }
  
  Future<List<Incident>> getAllIncidents() async {

    final url = "http://192.168.0.4:3000/incidents";

    final response = await Dio().get(url);

    if(response.statusCode == 200){

      final Iterable json = response.data;//jsonDecode(response.data);
      return json.map((incident) => Incident.fromJSON(incident)).toList();

    }else {
      throw Exception("Unable to get incdent");
    }

  }
}
