class Vehicle {
  Vehicle(
      {this.id,
        this.brand,
        this.model,
        this.plate,
        this.color,
        this.year,
        this.description,
        this.km,
        this.imageURL,
        this.owner});

  Vehicle.initial()
      : id = 0,
        brand = 0,
        model = 0,
        plate = '',
        color = '',
        year = 0,
        description = '',
        km = '';

  Vehicle.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    brand = json['brand'];
    model = json['model'];
    plate = json['plate'];
    color = json['color'];
    year = json['year'];
    description = json['description'];
    km = json['km'];
    imageURL = json['imageURL'];
    owner = json['owner'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['brand'] = brand;
    data['model'] = model;
    data['plate'] = plate;
    data['color'] = color;
    data['year'] = year;
    data['description'] = description;
    data['km'] = km;
    data['imageURL'] = imageURL;
    data['owner'] = owner;
    return data;
  }

  @override
  String toString() {
    return 'Vehicle{id: $id, brand: $brand, model: $model, plate: $plate, '
        'color: $color, year: $year, description: $description, km: $km, '
        'imageURL: $imageURL, owner: $owner}';
  }

  int id;
  int brand;
  int model;
  String plate;
  String color;
  int year;
  String description;
  String km;
  String imageURL;
  int owner;
}
