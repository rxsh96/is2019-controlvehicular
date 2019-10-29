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
      this.isActive,
      this.created,
      this.updated,
      this.imageURL,
      this.owner});

  Vehicle.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    brand = json['brand'];
    model = json['model'];
    plate = json['plate'];
    color = json['color'];
    year = json['year'];
    description = json['description'];
    km = json['km'];
    isActive = json['is_active'];
    created = json['created'];
    updated = json['updated'];
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
    data['is_active'] = isActive;
    data['created'] = created;
    data['updated'] = updated;
    data['imageURL'] = imageURL;
    data['owner'] = owner;
    return data;
  }


  @override
  String toString() {
    return 'Vehicle{id: $id, brand: $brand, model: $model, plate: $plate, '
        'color: $color, year: $year, description: $description, km: $km, '
        'isActive: $isActive, created: $created, updated: $updated, '
        'imageURL: $imageURL, owner: $owner}';
  }

  int id;
  int brand;
  int model;
  String plate;
  String color;
  String year;
  String description;
  String km;
  bool isActive;
  String created;
  String updated;
  String imageURL;
  int owner;
}
