class ItemModel {

  ItemModel({this.id, this.item, this.itype});

  ItemModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    item = json['item'];
    itype = json['itype'];
  }

  int id;
  String item;
  String itype;


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id.toString();
    data['item'] = item;
    data['itype'] = itype;
    return data;
  }

  @override
  String toString() {
    return 'ItemModel{id: $id, item: $item, itype: $itype}';
  }


}