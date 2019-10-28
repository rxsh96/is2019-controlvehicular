class LoginModel {

  LoginModel(this.token, this.email);

  LoginModel.fromJson(Map<String, dynamic> json) :
        token = json['token'],
        email = json['email'];

  Map<String, dynamic> toJson() => <String, dynamic>{
    'token': token,
    'email': email,
  };

  final String token;
  final String email;

}
