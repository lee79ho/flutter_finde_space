

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class TakePicturePage extends StatefulWidget{

  final CameraDescription camera;
  TakePicturePage({required this.camera});

  @override
  _TakePicturePage createState()=> _TakePicturePage();
}


class _TakePicturePage extends State<TakePicturePage>{


  late CameraController _cameraController;

  late Future<void> _initializeCameraControllerFuture;

  @override
  void initState()
  {
    super.initState();
    _cameraController = CameraController(widget.camera, ResolutionPreset.medium);
    _initializeCameraControllerFuture = _cameraController.initialize();

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Stack(children: <Widget>[
    FutureBuilder(future: _initializeCameraControllerFuture, builder: (context, snapshot){
      if(snapshot.connectionState == ConnectionState.done){
        return CameraPreview(_cameraController);
      }
      else{
        return Center(child:CircularProgressIndicator());
      }
    })
   ]);
  }

}