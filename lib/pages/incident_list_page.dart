
import 'package:flutter/material.dart';
import 'package:freash_news/pages/incident_report_page.dart';
import 'package:freash_news/widgets/incident_list.dart';

class IncidentListPage extends StatelessWidget{

  Future<void> _navigateToReportIncidentPage(BuildContext context) async{
    await Navigator.push(context, 
    MaterialPageRoute(builder: (context)=> IncidentReportPage(),
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
                    _navigateToReportIncidentPage(context);
                  },
                  ),
              )
            ),
            
          ],
        ),
    );
  }
}