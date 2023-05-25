class DiagnosticReport {
  final int id;
  final String dob;
  final String name;
  final String result;
  final String studyID;
  final String bodyPart;
  final String gender;

  DiagnosticReport(
      this.id,
      this.dob,
      this.name,
      this.result,
      this.studyID,
      this.bodyPart,
      this.gender,
      );
  factory DiagnosticReport.fromMap(Map<String, dynamic> json) {
    return DiagnosticReport(json['id'],json['dob'], json['name'], json['result'], json['studyID'], json['bodyPart'], json['gender']);
  }
  factory DiagnosticReport.fromJson(Map<String, dynamic> json) {
    return DiagnosticReport(json['id'],json['dob'], json['name'], json['result'], json['studyID'], json['bodyPart'], json['gender']);
  }
}
