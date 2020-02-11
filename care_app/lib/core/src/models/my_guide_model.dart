class MyGuideModel {

  MyGuideModel(
      {this.km,
        this.month,
        this.kmToInspect,
        this.isChange,
        this.isMaintenance,
        this.description,
        this.item});

  MyGuideModel.fromJson(Map<String, dynamic> json) {
    km = json['km'];
    month = json['month'];
    kmToInspect = json['km_to_inspect'];
    isChange = json['is_change'] == true;
    isMaintenance = json['is_maintenance'] == true;
    description = json['description'];
    item = json['item'];
  }

  int km;
  String month;
  int kmToInspect;
  bool isChange;
  bool isMaintenance;
  String description;
  String item;



  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['km'] = km;
    data['month'] = month;
    data['km_to_inspect'] = kmToInspect;
    data['is_change'] = isChange.toString();
    data['is_maintenance'] = isMaintenance.toString();
    data['description'] = description;
    data['item'] = item;
    return data;
  }
}