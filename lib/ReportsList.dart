import 'package:flutter/material.dart';
import 'DiagnosticReport.dart';
import 'ReportItem.dart';

class ReportList extends StatelessWidget {
  final List<DiagnosticReport> items;

  ReportList({Key key, this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(

      itemCount: items.length,
      itemBuilder: (context, index) {
        return ReportItem(item: items[index]);
      },
    );
  }
}
