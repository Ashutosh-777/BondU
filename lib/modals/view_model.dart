class ViewModel {
  int? views;
  int? contacted;
  Float? tapThroughRate;
  


  factory ContactModel.fromJson(Map<String, dynamic> json) => ContactModel(
    name: json['name'],
    phone: json['phone'],
    email: json['email'],
    companyName: json['companyName'],
  );
}
