import 'dart:convert';

PatientInfo patientInfoFromJson(String str) =>
    PatientInfo.fromJson(json.decode(str));

String patientInfoToJson(PatientInfo data) => json.encode(data.toJson());

class PatientInfo {
  PatientInfo({
    required this.id,
    required this.country,
    required this.hospital_name,
    required this.patientId,
    required this.treatment,
    required this.date,
  });

  int id;
  String country;
  String hospital_name;
  int patientId;
  String treatment;
  String date;

  factory PatientInfo.fromJson(Map<String, dynamic> json) => PatientInfo(
        id: json["id"],
        country: json["country"],
        hospital_name: json["hospital_name"],
        patientId: json["patient_id"],
        treatment: json["treatment"],
        date: json["date"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "country": country,
        "hospital_name": hospital_name,
        "patient_id": patientId,
        "treatment": treatment,
        "date": date,
      };
}
