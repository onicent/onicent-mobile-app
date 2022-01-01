class SignUpRequestModel {
  String? email;
  String? phoneNumber;
  String? password;
  String? fullName;
  String? country;

  SignUpRequestModel(
      {this.email,
        this.phoneNumber,
        this.password,
        this.fullName,
        this.country});

  SignUpRequestModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    password = json['password'];
    fullName = json['fullName'];
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['phoneNumber'] = this.phoneNumber;
    data['password'] = this.password;
    data['fullName'] = this.fullName;
    data['country'] = this.country;
    return data;
  }
}
