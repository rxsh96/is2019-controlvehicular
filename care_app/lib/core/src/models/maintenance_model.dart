class MaintenanceModel {
  MaintenanceModel(
      {this.id,
      this.km,
      this.month,
      this.kmToInspect,
      this.isChange,
      this.isMaintenance,
      this.description,
      this.brand,
      this.model,
      this.mName});

  MaintenanceModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    km = json['km'];
    month = json['month'];
    kmToInspect = json['km_to_inspect'];
    isChange = json['is_change'];
    isMaintenance = json['is_maintenance'];
    description = json['description'];
    brand = json['brand'];
    model = json['model'];
    mName = json['m_name'];
  }

  int id;
  int km;
  String month;
  int kmToInspect;
  bool isChange;
  bool isMaintenance;
  String description;
  int brand;
  int model;
  int mName;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['km'] = km;
    data['month'] = month;
    data['km_to_inspect'] = kmToInspect;
    data['is_change'] = isChange;
    data['is_maintenance'] = isMaintenance;
    data['description'] = description;
    data['brand'] = brand;
    data['model'] = model;
    data['m_name'] = mName;
    return data;
  }

  @override
  String toString() {
    return 'MaintenanceModel{id: $id, km: $km, month: $month, kmToInspect: $kmToInspect, isChange: $isChange, isMaintenance: $isMaintenance, description: $description, brand: $brand, model: $model, mName: $mName}';
  }
}
