import 'dart:convert';

import 'package:freash_news/models/place.dart';
import 'package:freash_news/utils/urlHelper.dart';
import 'package:http/http.dart' as http;

class Webservice1 {

  Future<List<Place>> fetchPlacesByKeywordAndPosition(String keyword, double latittude, double longitutde) async {

    final url = UrlHelper.urlForPlaceKeywordAndLocation(keyword, latittude, longitutde, "Ffdsf");



    final response = await http.get(Uri.parse(url));

    if(response.statusCode == 200)
    {
      final jsonResponse = jsonDecode(response.body);
      final Iterable results = jsonResponse["results"];
      return results.map((place) => Place.fromJson(place)).toList();


    }
    else{
      throw Exception("Unable to perform request!");
    }


  }
}