class ContactModel {
  String? name;
  String? phone;
  String? email;
  String? companyName;

  ContactModel({this.name, this.companyName, this.email, this.phone});

  factory ContactModel.fromJson(Map<String, dynamic> json) => ContactModel(
        name: json['name'] == null ? null : (json['name'] as String).trim(),
        phone: json['mobile'],
        email: json['email'],
        companyName: json['companyName'],
      );
}
