import 'dart:convert';

Patient patientFromJson(String str) => Patient.fromJson(json.decode(str));

String patientToJson(Patient data) => json.encode(data.toJson());

/**
 * Patient Model
 */
class Patient {
  Patient({
    this.patientId,
    this.firstName,
    this.lastName,
    this.dateBirth,
    this.adress,
    this.email,
    this.phone,
  });

  String patientId;
  String firstName;
  String lastName;
  String dateBirth;
  String adress;
  String email;
  String phone;

/**
 * allow to convert a Patient objet  from Json
 */
  factory Patient.fromJson(Map<String, dynamic> json) => Patient(
        patientId: json["PatientID"],
        firstName: json["FirstName"],
        lastName: json["LastName"],
        dateBirth: json["DateBirth"],
        adress: json["Adress"],
        email: json["Email"],
        phone: json["Phone"],
      );

  /**
 * allow to convert a Patient objet to Json
 */

  Map<String, dynamic> toJson() => {
        "PatientID": patientId,
        "FirstName": firstName,
        "LastName": lastName,
        "DateBirth": dateBirth,
        "Adress": adress,
        "Email": email,
        "Phone": phone,
      };
}
