class TripModel {

  TripModel(
      {this.description,
        this.startPlace,
        this.endPlace,
        this.startKm,
        this.finalKm,
        this.date,
        this.isActive,
        this.startTime,
        this.endTime,
        this.noPassenger,
        this.vehicle});

  TripModel.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    startPlace = json['start_place'];
    endPlace = json['end_place'];
    startKm = int.parse(json['start_km'].toString());
    finalKm = int.parse(json['final_km'].toString());
    date = json['date'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    isActive = json['is_active'].toString() == 'true';
    noPassenger = int.parse(json['no_passanger'].toString());
    vehicle = int.parse(json['vehicle'].toString());
  }

  String description;
  String startPlace;
  String endPlace;
  int startKm;
  int finalKm;
  bool isActive;
  String date;
  String startTime;
  String endTime;
  int noPassenger;
  int vehicle;



  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['description'] = description;
    data['start_place'] = startPlace;
    data['end_place'] = endPlace;
    data['start_km'] = startKm;
    data['final_km'] = finalKm;
    data['date'] = date;
    data['is_active'] = isActive;
    data['start_time'] = startTime;
    data['end_time'] = endTime;
    data['no_passanger'] = noPassenger;
    data['vehicle'] = vehicle;
    return data;
  }
}