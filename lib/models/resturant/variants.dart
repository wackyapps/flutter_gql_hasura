class variants {
  Data? data;

  variants({this.data});

  variants.fromJson(Map<String, dynamic> json) {
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
  List<ResturantsItems>? resturantsItems;

  Data({this.resturantsItems});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['resturants_items'] != null) {
      resturantsItems = <ResturantsItems>[];
      json['resturants_items'].forEach((v) {
        resturantsItems!.add(new ResturantsItems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.resturantsItems != null) {
      data['resturants_items'] =
          this.resturantsItems!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ResturantsItems {
  int? id;
  String? items;

  ResturantsItems({this.id, this.items});

  ResturantsItems.fromJson(Map<String, dynamic> json) {
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
