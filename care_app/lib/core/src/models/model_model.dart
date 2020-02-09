class ModelModel {


  ModelModel({this.id, this.model, this.brand});

  ModelModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    model = json['model'];
    brand = json['brand'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id.toString();
    data['model'] = model;
    data['brand'] = brand;
    return data;
  }


  @override
  String toString() {
    return 'ModelModel{id: $id, brand: $brand, model: $model}';
  }

  int id;
  int brand;
  String model;

}