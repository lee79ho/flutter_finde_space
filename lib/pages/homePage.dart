
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:freash_news/viewmodels/PlaceListViewModel.dart';
import 'package:freash_news/viewmodels/placeViewModel.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map_launcher/map_launcher.dart' as prefix0;
import 'package:map_launcher/map_launcher.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();

}

class _HomePageState extends State<HomePage>{

  Completer<GoogleMapController> _controller = Completer();
  late Position _currentPositon;


  @override
  void initState()
  {
    super.initState();
  }

  Set<Marker> _getPlaceMarkers(List<PlaceViewModel> places){

    return places.map((place) {
      return Marker(
      markerId: MarkerId(place.placeId),
      icon: BitmapDescriptor.defaultMarker,
      infoWindow: InfoWindow(title:place.name),
      position: LatLng(place.latitude, place.longitude)
      );
  }).toSet();


  }




  Future<void> _onMapCreated(GoogleMapController controller) async{
    _controller.complete(controller);
    _currentPositon = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
     controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: LatLng(_currentPositon.latitude, _currentPositon.longitude), zoom: 14)
     ));


  }
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
    minimumSize: Size(300, 100),
    backgroundColor: Colors.grey,
    padding: EdgeInsets.all(0),
  );


  void _openMapsFor(PlaceViewModel vm) async{
    
    if(await MapLauncher.isMapAvailable(prefix0.MapType.google) as bool){
      await MapLauncher.launchMap(
        mapType: prefix0.MapType.google,
        coords: Coords(vm.latitude, vm.longitude),
        title: vm.name,
        description: vm.name
      );
    } else if(await MapLauncher.isMapAvailable(prefix0.MapType.apple) as bool ){
      await MapLauncher.launchMap(
        mapType: prefix0.MapType.apple,
        coords: Coords(vm.latitude, vm.longitude),
        title: vm.name,
        description: vm.name
      );
    }

  }


  @override
  Widget build(BuildContext contet){

   
   final vm = Provider.of<PlaceListViewModel>(context);
    print(vm.places);

    return Scaffold(
      body:Stack(children: <Widget>[
        GoogleMap(
          mapType: vm.mapType,
          markers: _getPlaceMarkers(vm.places),
          myLocationEnabled: true,
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(target: LatLng(45.521563, -122.677433), zoom: 14),

        ),
        SafeArea(
          child: TextField(
            onSubmitted: (value){
              vm.fetchPlacesByKeywordAndPosition(value, _currentPositon.latitude, _currentPositon.longitude);
            },
            decoration: InputDecoration(
              labelText: "Search here",
              fillColor: Colors.white,
              filled: true
            ),
          ),
        ),
        Visibility(
          
          visible: vm.places.length > 0 ? true : false,
          child: SafeArea(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: TextButton(
                    style: flatButtonStyle,
                    child: Text("Show List", style: TextStyle(color: Colors.white)),
                    onPressed:(){
                      showModalBottomSheet(
                        context: context, 
                        builder: (context) => PlaceList(
                        places: vm.places,
                        onSelected: _openMapsFor,
                      )
                      );
                      
                    },
                  )
                ),)
            ),)
          )
          Positioned(
              top: 150, 
              right: 10,
              child: FloatingActionButton(
              onPressed: (){
                vm.toggleMapType();
              },
              child: Icon(Icons.map)
              ),
          )
      ]),
    );
  }
}