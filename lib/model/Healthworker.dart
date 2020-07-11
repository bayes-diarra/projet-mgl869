
enum Type{Doctor, Pharmacist}
class Healthworker{
  String healthworkerId;
  String firstname;
  String lastname;
  String dateBirth;
  String address;
  String phone;
  String email;
  String type;

  Healthworker({this.healthworkerId, this.firstname,this.lastname,this.dateBirth,this.email,this.address,this.phone,this.type});
}