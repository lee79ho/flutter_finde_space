

import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:freash_news/models/incident.dart';
import 'package:path/path.dart';

class Webservice {
  Future<void> saveIncident(Incident incident) async {

    File file = File(incident.imageURL);
    final filename = basename(file.path.replaceAll(" ",""));

    log(incident.title);
    log(incident.description);
    final url = "http://192.168.0.4:3000/incidents";

    FormData formData = FormData.fromMap({
      "title": incident.title,
      "description": incident.description,
      "image": await MultipartFile.fromFile(incident.imageURL, filename: filename)
    }
    );

    await Dio().post(
      url, data: formData);
    
    /*

    await Dio().post(
      url,
      data: {"title": incident.title, "description": incident.description},
      options: Options(contentType: "application/x-www-form-urlencoded")
    );*/
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
