class User {
  User({this.id, this.name, this.lastname, this.phone_number, this.email});

  User.initial()
      : id = 0,
        name = '',
        lastname = '',
        phone_number = '',
        email = '';

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    lastname = json['lastname'];
    phone_number = json['phone_number'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'id': id,
    'name': name,
    'lastname': lastname,
    'phone_number': phone_number,
    'email': email,
  };

  @override
  String toString() {
    return 'User{id: $id, name: $name, lastName: $lastname, email: $email, phoneNumber: $phone_number}';
  }

  int id;
  String name;
  String lastname;
  String phone_number;
  String email;
}
