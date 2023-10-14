import 'dart:io';
import 'dart:typed_data';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:freash_news/pages/take_picture_page.dart';
import 'package:freash_news/viewmodels/report_incident_view_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class IncidentReportPage extends StatefulWidget {

  @override
  _IncidentReportPageState createState() => _IncidentReportPageState();
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class _IncidentReportPageState extends State<IncidentReportPage>{



  late ReportIncidentViewModel _reportIncidentViewModel;

  @override
  void initState(){
    super.initState();
    _reportIncidentViewModel = Provider.of<ReportIncidentViewModel>(context, listen: false);

  }

  void _saveIncident(BuildContext context) async{
    await _reportIncidentViewModel.saveIncident();
    Navigator.pop(context);
  }
  void _showCamera() async
  {
    final cameras = await availableCameras();
    final camera = cameras.first;

    final result = await Navigator.push(context,
    MaterialPageRoute(
      builder:(context) => TakePicturePage(camera: camera)));

      setState(() {
        _reportIncidentViewModel.imagePath = result;
      });
    
  }

  void _showPhotoAlbum() async {


   final image  = await ImagePicker().pickImage(source: ImageSource.gallery);//.pickImage(source: ImageSource.gallery);
  
    setState((){
      _reportIncidentViewModel.imagePath = image!.path;
    });
  }
  
  void _showPhotoSelectionOptions(BuildContext context){

    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: 150,
          child: Column(children: <Widget>[
            ListTile(
              onTap: () {
                Navigator.of(context).pop();
                _showCamera();
              },
              leading: Icon(Icons.photo_camera),
              title: Text("Take a picture")
              ),
            ListTile(
              onTap: (){
                Navigator.of(context).pop();
                _showPhotoAlbum();
              },
              leading: Icon(Icons.photo_album),
              title:Text("Select from photo library")
            )
          ]
          )
          );
      }

    );


  }

  final ButtonStyle flatButtonStyle = TextButton.styleFrom(
    backgroundColor: Colors.green,
    padding: EdgeInsets.all(0),
  );

    final ButtonStyle topflatButtonStyle = TextButton.styleFrom(
    minimumSize: Size(100, 30),
    backgroundColor: Colors.grey,
    padding: EdgeInsets.all(0),
  );


  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<ReportIncidentViewModel>(context);
    

    return Scaffold(
      appBar: AppBar(
        title:Text("Report an incient")

      ),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[

          vm.imagePath != null ?  Image.file(File(vm.imagePath!)) : Image.asset("images/houston.jpg"),



          TextButton(
          style: topflatButtonStyle,
          onPressed: () {
            _showPhotoSelectionOptions(context);
          },
          child: Text(
           "Take Picture",
             style: TextStyle(color: Colors.white),
          ),
         ),

          TextField(
            onChanged: (value) => vm.title = value,

            decoration: InputDecoration(
              labelText: "enter title",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10)
                )
            ),
          ),

          TextField(
            onChanged: (value) => vm.description = value,
            textInputAction: TextInputAction.done,
            maxLines: null,
            keyboardType:TextInputType.multiline,
            decoration: InputDecoration(
              labelText: "Enter desciption"
            ),

          ),
         TextButton(
          style: flatButtonStyle,
          onPressed: () {
            _saveIncident(context);
    
          },
          child: Text(
           "Save",
             style: TextStyle(color: Colors.white),
          ),
         )
        ]),
        )
    );
  }
}