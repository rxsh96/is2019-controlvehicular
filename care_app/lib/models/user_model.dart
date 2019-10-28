class User{

  User(this.id, this.name, this.lastName, this.phoneNumber, this.email);

  User.fromJson(Map<String, dynamic> json) :
        id = json['id'],
        name = json['name'],
        lastName = json['lastName'],
        phoneNumber = json['phoneNumber'],
        email = json['email'];


  Map<String, dynamic> toJson() => <String, dynamic>{
    'id': id,
    'name' : name,
    'lastName' : lastName,
    'phoneNumber' : phoneNumber,
    'email' : email
  };

  int id;
  String name;
  String lastName;
  String phoneNumber;
  String email;

}