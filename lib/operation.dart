import 'dart:convert';
import 'dart:async';
import 'package:rest_api_flutter/DiagnosticReport.dart';


import 'DiagnosticReport.dart';
import 'package:http/http.dart' as http;

Future<List<DiagnosticReport>> fetchReports() async {
  String url = "http://ehr.radreports.ai/hapi-fhir-jpaserver/fhir/";

  final response = await http.get(
      url+ "DiagnosticReport");
  if (response.statusCode == 200) {
    var values = json.decode(response.body);
    var entry = values["entry"] as List;
    // DiagnosticReport reports;
    List<DiagnosticReport>  reports = [];
;    var listIterator = entry.iterator;
int id = 0;
    while (listIterator.moveNext()) {
      var resource = listIterator.current["resource"];
      var subj = resource["subject"];
      var ref = subj["reference"];

      var conclusion = resource["conclusion"];

      // resource.conclusionCode[0].coding[0].code
      var conclusionCode = resource["conclusionCode"];
      // print(conclusionCode);
      var coding = conclusionCode[0];
      // print("coding");
      // print(coding);
      var code = coding["coding"];
      // print(code);
      var codeTextIndex = code[0];
      // print(codeTextIndex);
      var studyID = codeTextIndex["code"];


      var patient = await getPatient( url,ref);
      var bodyPart = resource["result"];
      var bodySite = bodyPart[0];
      var obReference = bodySite["reference"];
      var observation = await getObservation(url, obReference);

      var fullName = patient["name"];
      var dob = patient["age"];
      var gender = patient["gender"];
      var dr = {
        "id": id,
        "dob": dob,
        "name" : fullName,
        "result": conclusion,
        "studyID":studyID,
        "bodyPart": observation,
        "gender": gender,
      };
      id = id + 1;
      DiagnosticReport report = DiagnosticReport.fromJson(dr);

      reports.add(report);

    }
    //
    print(reports);
    return reports;
  } else {
    throw Exception('Unable to fetch data from the REST API');
  }
}
Future<Map>  getPatient(String url,String responseBody) async{
  final response = await http.get(
      url+ responseBody);
  if (response.statusCode == 200) {
    var values = json.decode(response.body);
    var fname = values["name"];
     var name = fname[0];
     var familyName = name["family"];
     var given = name["given"];
     var firstName = given[0];
    var fullName = firstName + " "+ familyName;

    var d = {
      "name": fullName,
      "age" : values["birthDate"],
      "gender": values["gender"]
    };
    // print(d);
    return d;
  } else {
    throw Exception('Unable to fetch data from the REST API');
  }
}

Future<String>  getObservation(String url,String responseBody) async{
  final response = await http.get(
      url+ responseBody);
  if (response.statusCode == 200) {
    var values = json.decode(response.body);
    var coding = values["bodySite"];
    String bodyPart = coding["text"];
    // print("bodyPart :" +bodyPart);

    return bodyPart;
  } else {
    throw Exception('Unable to fetch data from the REST API');
  }
}



