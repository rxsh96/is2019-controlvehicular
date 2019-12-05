class BrandModel {

  BrandModel({this.id, this.brand});

  BrandModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    brand = json['brand'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['brand'] = brand;
    return data;
  }

  int id;
  String brand;

}