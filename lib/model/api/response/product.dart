class Products {
  Products({
      this.id, 
      this.company, 
      this.name, 
      this.type, 
      this.price, 
      this.image, 
      this.description,});

  Products.fromJson(dynamic json) {
    id = json['id'];
    company = json['company'];
    name = json['name'];
    type = json['type'];
    price = json['price'];
    image = json['image'];
    description = json['description'];
  }
  int? id;
  String ?company;
  String ?name;
  String ?type;
  String ?price;
  String ?image;
  String ?description;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['company'] = company;
    map['name'] = name;
    map['type'] = type;
    map['price'] = price;
    map['image'] = image;
    map['description'] = description;
    return map;
  }

}