class ModelModel {


  ModelModel({this.model, this.brand});

  ModelModel.fromJson(Map<String, dynamic> json) {
    model = json['model'];
    brand = json['brand'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['model'] = model;
    data['brand'] = brand;
    return data;
  }

  int brand;
  String model;

}