class MyMaintenanceDetailModel {

  MyMaintenanceDetailModel(
      {this.date,
        this.price,
        this.km,
        this.item,
        this.vehicleKm,
        this.localName});


  String date;
  double price;
  String km;
  String item;
  int vehicleKm;
  String localName;



  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['date'] = date;
    data['price'] = price;
    data['km'] = km;
    data['item'] = item;
    data['vehicle_km'] = vehicleKm;
    data['local_name'] = localName;
    return data;
  }
}