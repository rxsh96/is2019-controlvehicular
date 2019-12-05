class User {
  User({this.id, this.name, this.lastname, this.phone_number, this.email, this.password, this.is_active});

  User.register({this.name, this.lastname, this.phone_number, this.email, this.password, this.is_active});

  User.initial()
      : id = 0,
        name = '',
        lastname = '',
        phone_number = '',
        email = '',
        password = '',
        is_active = 'false';

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    lastname = json['lastname'];
    phone_number = json['phone_number'];
    email = json['email'];
    is_active = json['is_active'];
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'id': id,
    'name': name,
    'lastname': lastname,
    'phone_number': phone_number,
    'email': email,
    'password': password,
    'is_active': is_active,
  };

  @override
  String toString() {
    return 'User{id: $id, name: $name, lastName: $lastname, email: $email, phoneNumber: $phone_number, password: $password, is_active: $is_active}';
  }

  int id;
  String name;
  String lastname;
  String phone_number;
  String email;
  String password;
  String is_active;
}
