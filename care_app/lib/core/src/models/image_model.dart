class ProfileImageModel {

  ProfileImageModel({this.file, this.user});

  ProfileImageModel.fromJson(Map<String, dynamic> json) {
    file = json['file'];
    user = json['user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['file'] = file;
    data['user'] = user;
    return data;
  }
  String file;
  int user;
}