import 'package:intl/intl.dart';

class ContactModel {
  String? name;
  String? phone;
  String? email;
  String? companyName;
  DateTime? date;

  ContactModel(
      {this.name, this.companyName, this.email, this.phone, this.date});

  factory ContactModel.fromJson(Map<String, dynamic> json) => ContactModel(
        name: json['name'] == null ? null : (json['name'] as String).trim(),
        phone: json['mobile'],
        email: json['email'],
        companyName: json['companyName'],
        date: json['date'] == null
            ? null
            : DateFormat("d/M/yyyy").parse(json['date']),
      );
}
