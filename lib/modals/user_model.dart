class UserInfo {
  String? name;
  int? phone;
  String? bio;
  String? email;
  String? designation;
  String? companyName;
  Map<String, dynamic>? socialMediaHandles;
  String? id;

  UserInfo(
      {this.name,
      this.socialMediaHandles,
      this.companyName,
      this.designation,
      this.id,
      this.bio,
      this.email,
      this.phone});

  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
      name: json['name'] ?? '',
      phone: json['phone'] ?? '',
      bio: json['bio'] ?? 'Please add bio',
      email: json['email'] ?? '',
      designation: json['designation'],
      companyName: json['companyName'],
      socialMediaHandles: json['socialMediaHandles'],
      id: json['_id']);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['phone'] = phone;
    data['bio'] = bio;
    data['email'] = email;
    data['socialMediaHandles'] = socialMediaHandles;
    data['companyName'] = companyName;
    data['designation'] = designation;
    data['_id'] = id;
    return data;
  }
}
