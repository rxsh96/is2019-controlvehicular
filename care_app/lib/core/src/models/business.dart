
class Business {

    String id;
    String ruc;
    String businessName;
    String description;
    String legalRepresentativeName;
    String legalRepresentativeLastname;
    String address;
    String created;
    String updated;
    String lon;
    String lat;
    String province;
    String city;
    String businessOwner;

    Business({
        this.id,
        this.ruc,
        this.businessName,
        this.description,
        this.legalRepresentativeName,
        this.legalRepresentativeLastname,
        this.address,
        this.created,
        this.updated,
        this.lon,
        this.lat,
        this.province,
        this.city,
        this.businessOwner,
    });

      Business.initial()
      : id = '',
        ruc = '',
        businessName = '',
        description = '',
        legalRepresentativeName = '',
        legalRepresentativeLastname = '',
        address = '',
        created = '',
        updated = '',
        lon = '',
        lat = '',
        province = '',
        city = '',
        businessOwner = '';


    Business.fromJson(Map<String, dynamic> json) {
        id= json['id'];
        ruc= json['ruc'];
        businessName: json['business_name'];
        description: json['description'];
        legalRepresentativeName: json['legal_representative_name'];
        legalRepresentativeLastname: json['legal_representative_lastname'];
        address: json['address'];
        created: json['created'];
        updated: json['updated'];
        lon: json['lon'];
        lat: json['lat'];
        province: json['province'];
        city: json['city'];
        businessOwner: json['business_owner'];
    }

    Map<String, dynamic> toJson()  {
      final Map<String, dynamic> data = <String, dynamic>{};
        data['id'] = id;
        data['ruc'] = ruc;
        data['business_name']= businessName;
        data['description']= description;
        data['legal_representative_name']= legalRepresentativeName;
        data['legal_representative_lastname']= legalRepresentativeLastname;
        data['address']= address;
        data['created']= created;
        data['updated']= updated;
        data['lon']= lon;
        data['lat']= lat;
        data['province']= province;
        data['city']= city;
        data['business_owner'] = businessOwner;
        return data;
    }


   @override
  String toString() {
    return 'Business{id: $id, brand: $ruc, business_name: $businessName, description: $description, '
        'legal_representative_name: $legalRepresentativeName, legal_representative_lastname: $legalRepresentativeLastname, address: $address, created: $created, '
        'updated: $updated, lon: $lon, lat: $lat, province: $province, city: $city, business_owner: $businessOwner }';
  }
}






