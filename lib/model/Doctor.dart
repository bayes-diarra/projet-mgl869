import 'dart:convert';

Doctor doctorFromJson(String str) => Doctor.fromJson(json.decode(str));

String doctorToJson(Doctor data) => json.encode(data.toJson());

/**
 * Doctor Model
 */
class Doctor {
  Doctor({
    this.doctorId,
    this.firstName,
    this.lastName,
    this.dateBirth,
    this.adress,
    this.email,
    this.phone,
    this.patients,
  });

  String doctorId;
  String firstName;
  String lastName;
  String dateBirth;
  String adress;
  String email;
  String phone;
  List<dynamic> patients;

  /**
 * allow to convert a Doctor objet  from Json
 */
  factory Doctor.fromJson(Map<String, dynamic> json) => Doctor(
        doctorId: json["DoctorID"],
        firstName: json["FirstName"],
        lastName: json["LastName"],
        dateBirth: json["DateBirth"],
        adress: json["Adress"],
        email: json["Email"],
        phone: json["Phone"],
        patients: List<dynamic>.from(json["Patients"].map((x) => x)),
      );

  /**
 * allow to convert a Doctor objet  to Json
 */
  Map<String, dynamic> toJson() => {
        "DoctorID": doctorId,
        "FirstName": firstName,
        "LastName": lastName,
        "DateBirth": dateBirth,
        "Adress": adress,
        "Email": email,
        "Phone": phone,
        "Patients": List<dynamic>.from(patients.map((x) => x)),
      };
}
