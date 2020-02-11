import 'package:intl/intl.dart';

class MaintenanceDetailsModel {

  MaintenanceDetailsModel(
      {this.date, this.price, this.km, this.item, this.vehicle, this.local});

  MaintenanceDetailsModel.fromJson(Map<String, dynamic> json) {
    date = DateFormat('yyyy-MM-dd').parse(json['date']).toString();
    price = double.parse(json['price']);
    km = json['km'];
    item = json['item'];
    vehicle = json['vehicle'];
    local = json['local'];
  }

  String date;
  double price;
  String km;
  int item;
  int vehicle;
  int local;


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['date'] = date;
    data['price'] = price;
    data['km'] = km;
    data['item'] = item;
    data['vehicle'] = vehicle;
    data['local'] = local;
    return data;
  }
}