import 'package:flutter/material.dart';
import 'dart:async';
import 'DiagnosticReport.dart';
import 'ReportsList.dart';
import 'ReportItem.dart';
import 'operation.dart';

void main() => runApp(MyApp(products: fetchReports()));

class MyApp extends StatelessWidget {
  final Future<List<DiagnosticReport>> products;

  MyApp({this.products});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(products: products),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final Future<List<DiagnosticReport>> products;

  MyHomePage({this.products});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Diagnostic Reports",
              style: TextStyle(color:Colors.pink)),

          backgroundColor: Colors.black,
          centerTitle: true,
        ),
        body: Center(
          child: FutureBuilder<List<DiagnosticReport>>(
            future: products,
            builder: (context, snapshot) {
              if (snapshot.hasError) print(snapshot.error);
              return snapshot.hasData
                  ? ReportList(items: snapshot.data)
                  : Center(child: CircularProgressIndicator());
            },
          ),
        ));
  }
}
