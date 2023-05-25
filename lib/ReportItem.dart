import 'package:flutter/material.dart';

import 'DiagnosticReport.dart';
import 'WebViewPage.dart';
class ReportItem extends StatelessWidget {
  String url = "https://pacs.deepmd.io/viewer/";
  ReportItem({this.item});

  final DiagnosticReport item;

  Widget build(BuildContext context) {
    return Container(

      color: Color(0xff2F2F2F),
        padding: EdgeInsets.all(2),
        height: 140,

        child: Card(

          elevation: 2,
          color: Color(0xff2C2C2E),
    child: InkWell(
    onTap: () {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => WebViewPage(url+ this.item.studyID,"viewer")));
    // Function is executed on tap.
    },
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[

                Expanded(
                    child: Container(

                        padding: EdgeInsets.all(2),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text(this.item.name,
                                style: TextStyle(color:Colors.green,fontWeight: FontWeight.bold)),
                            Text("Result:${this.item.dob}",
                                style: TextStyle(color:Colors.green,fontWeight: FontWeight.bold)),
                            Text("BodyPart:${this.item.gender}",
                                style: TextStyle(color:Colors.green,fontWeight: FontWeight.bold)),
                          ],
                        ))),
                Expanded(
                    child: Container(
                        padding: EdgeInsets.all(2),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            // Text(this.item.name,
                            //     style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold)),
                            Text("Result:${this.item.result}",
                                style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold)),
                            Text("BodyPart:${this.item.bodyPart}",
                                style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold)),
                          ],
                        )))
              ]),
    )
        )

    );

  }
}
