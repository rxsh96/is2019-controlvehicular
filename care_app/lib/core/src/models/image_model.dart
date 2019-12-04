class ProfileImage {

  ProfileImage({this.file, this.user});

  ProfileImage.fromJson(Map<String, dynamic> json) {
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
  String user;
}