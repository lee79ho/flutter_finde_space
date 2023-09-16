
import 'package:flutter/material.dart';
import 'package:freash_news/service/webservice.dart';
import 'package:freash_news/viewmodels/placeViewModel.dart';



class PlaceListViewModel extends ChangeNotifier
{
  var places = List<PlaceViewModel>();


  Future<void> fetchPlacesByKeywordAndPosition(String keyword, double latitude, double longitude) async {

    final result = await Webservice().fetchPlacesByKeywordAndPosition(keyword, latitude, longitude);
    this.places = result.map((place) => PlaceViewModel(place)).toList();
    notifyListeners();

  }

  




}