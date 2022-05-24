class resturants_info {
  Data? data;

  resturants_info({this.data});

  resturants_info.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<ResturantsNames>? resturantsNames;

  Data({this.resturantsNames});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['resturants_names'] != null) {
      resturantsNames = <ResturantsNames>[];
      json['resturants_names'].forEach((v) {
        resturantsNames!.add(new ResturantsNames.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.resturantsNames != null) {
      data['resturants_names'] =
          this.resturantsNames!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ResturantsNames {
  int? id;
  String? name;
  String? location;
  Item? item;

  ResturantsNames({this.id, this.name, this.location, this.item});

  ResturantsNames.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    location = json['location'];
    item = json['item'] != null ? new Item.fromJson(json['item']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['location'] = this.location;
    if (this.item != null) {
      data['item'] = this.item!.toJson();
    }
    return data;
  }
}

class Item {
  int? id;
  String? items;

  Item({this.id, this.items});

  Item.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    items = json['items'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['items'] = this.items;
    return data;
  }
}
