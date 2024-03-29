class DeviceModel {

  DeviceModel(
      {this.name, this.registrationId, this.deviceId, this.active, this.type});

  DeviceModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    registrationId = json['registration_id'];
    deviceId = json['device_id'];
    active = json['active'] == 'true';
    type = json['type'];
  }

  String name;
  String registrationId;
  String deviceId;
  bool active;
  String type;


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['registration_id'] = registrationId;
    data['device_id'] = deviceId;
    data['active'] = active.toString();
    data['type'] = type;
    return data;
  }

  @override
  String toString() {
    return 'DeviceModel{name: $name, registrationId: $registrationId, deviceId: $deviceId, active: $active, type: $type}';
  }


}