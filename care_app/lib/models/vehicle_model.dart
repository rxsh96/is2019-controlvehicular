class VehicleModel{

  String brand;
  String model;
  String plate;
  String color;
  String year;
  String description;
  String km;
  bool isActive;
  int owner;

  VehicleModel({this.brand, this.model, this.plate, this.color,
  this.year, this.description, this.km, this.isActive, this.owner});

  VehicleModel.fromJson(Map<String, dynamic> json) :
        brand = json['brand'],
        model = json['model'],
        plate = json['plate'],
        color = json['color'],
        year = json['year'],
        description = json['description'],
        km = json['km'],
        isActive = json['is_active'],
        owner = json['owner'];

  Map<String, dynamic> toJson() => {
    'brand' : brand,
    'model' : model,
    'plate' : plate,
    'color' : color,
    'year' : year,
    'description' : description,
    'km' : km,
    'is_active' : isActive,
    'owner' : owner,
  };

}
