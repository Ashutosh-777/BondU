class ContactModel {
  String? name;
  int? phone;
  String? email;
  String? companyName;

  ContactModel({this.name, this.companyName, this.email, this.phone});

  factory ContactModel.fromJson(Map<String, dynamic> json) => ContactModel(
        name: json['name'],
        phone: json['phone'],
        email: json['email'],
        companyName: json['companyName'],
      );
}
