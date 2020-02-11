class TransitTaxModel {

  TransitTaxModel(
      {this.value,
        this.date,
        this.reason,
        this.address,
        this.agency,
        this.agent,
        this.user});

  TransitTaxModel.fromJson(Map<String, dynamic> json) {
    value = double.parse(json['value']);
    date = json['date'];
    reason = json['reason'];
    address = json['address'];
    agency = json['agency'];
    agent = json['agent'];
    user = int.parse(json['user'].toString());
  }

  double value;
  String date;
  String reason;
  String address;
  String agency;
  String agent;
  int user;


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['value'] = value;
    data['date'] = date;
    data['reason'] = reason;
    data['address'] = address;
    data['agency'] = agency;
    data['agent'] = agent;
    data['user'] = user;
    return data;
  }
}