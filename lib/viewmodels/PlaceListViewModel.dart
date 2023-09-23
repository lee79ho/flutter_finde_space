
import 'package:flutter/material.dart';
import 'package:freash_news/service/webservice.dart';
import 'package:freash_news/service/webservice1.dart';
import 'package:freash_news/viewmodels/placeViewModel.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';



class PlaceListViewModel extends ChangeNotifier
{
  var places = List<PlaceViewModel>;//List<PlaceViewModel>();
  var mapType = MapType.normal;

  void toggleMapType()
  {
    this.mapType = this.mapType == MapType.normal ? MapType.satellite :  MapType.normal;
    notifyListeners();
  }

  Future<void> fetchPlacesByKeywordAndPosition(String keyword, double latitude, double longitude) async {

    final result = await Webservice1().fetchPlacesByKeywordAndPosition(keyword, latitude, longitude);
   // this.places =
  
   // result.map((places) => PlaceViewModel(places))// result.map((place) => PlaceViewModel(place)).toList();
    notifyListeners();

  }

  




}