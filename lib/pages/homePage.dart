
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();

}

class _HomePageState extends State<HomePage>{

  @override
  void initState()
  {
    super.initState();
    _getCurrentPosition();
  }

  Future<void> _getCurrentPosition() async {
    final position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print(position);
  }



  Completer<GoogleMapController> _controller = Completer();


  Future<void> _onMapCreated(GoogleMapController controller) async{
    _controller.complete(controller);
    final position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
     controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(position.latitude, position.longitude), zoom: 14)
     ));


  }
  @override
  Widget build(BuildContext contet){

   


    return Scaffold(
      body:Stack(children: <Widget>[
        GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(target: LatLng(45.521563, -122.677433), zoom: 14),

        ),
        SafeArea(
          child: TextField(
            decoration: InputDecoration(
              labelText: "Search here",
              fillColor: Colors.white,
              filled: true
            ),
          ),
        )

      ],),
    );
  }
}