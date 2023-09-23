
import 'package:flutter/material.dart';
import 'package:freash_news/models/incident.dart';
import 'package:freash_news/pages/incident_report_page.dart';
import 'package:freash_news/service/webservice.dart';
import 'package:freash_news/viewmodels/report_incident_view_model.dart';
import 'package:freash_news/widgets/incident_list.dart';
import 'package:provider/provider.dart';

class IncidentListPage extends StatelessWidget{

  Future<void> _navigateToReportIncidentPage(BuildContext context) async{
    await Navigator.push(context, 
    MaterialPageRoute(builder: (context)=> 
    ChangeNotifierProvider(
      create: (context) => ReportIncidentViewModel(),
      child: IncidentReportPage(),
    ),
    fullscreenDialog: true

    ));
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Incients"),
        backgroundColor: Colors.green,
      ),
      body: Stack(
        children: <Widget>[
            IncidentList(),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FloatingActionButton(
                  child: Icon(Icons.add),
                  onPressed: (){
                   final incidents =  Webservice().getAllIncidents();
                   debugPrint("$incidents");
                   // _navigateToReportIncidentPage(context);
                  },
                  ),
              )
            ),
            
          ],
        ),
    );
  }
}