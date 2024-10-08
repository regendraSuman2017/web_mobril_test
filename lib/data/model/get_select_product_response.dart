class GetSelectProductResponse {
  String? status;
  String? message;
  Product? product;

  GetSelectProductResponse({this.status, this.message, this.product});

  GetSelectProductResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    product =
    json['product'] != null ? Product.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (product != null) {
      data['product'] = product!.toJson();
    }
    return data;
  }
}

class Product {
  int? id;
  String? title;
  String? image;
  int? price;
  String? description;
  String? brand;
  String? model;
  String? color;
  String? category;
  bool? popular;
  int? discount;

  Product(
      {this.id,
        this.title,
        this.image,
        this.price,
        this.description,
        this.brand,
        this.model,
        this.color,
        this.category,
        this.popular,
        this.discount});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    price = json['price'];
    description = json['description'];
    brand = json['brand'];
    model = json['model'];
    color = json['color'];
    category = json['category'];
    popular = json['popular'];
    discount = json['discount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['image'] = image;
    data['price'] = price;
    data['description'] = description;
    data['brand'] = brand;
    data['model'] = model;
    data['color'] = color;
    data['category'] = category;
    data['popular'] = popular;
    data['discount'] = discount;
    return data;
  }
}


class dGetSelectProductResponse {
  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;
  Rating? rating;

  dGetSelectProductResponse(
      {this.id,
        this.title,
        this.price,
        this.description,
        this.category,
        this.image,
        this.rating});

  dGetSelectProductResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    description = json['description'];
    category = json['category'];
    image = json['image'];
    rating =
    json['rating'] != null ? Rating.fromJson(json['rating']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['price'] = price;
    data['description'] = description;
    data['category'] = category;
    data['image'] = image;
    if (rating != null) {
      data['rating'] = rating!.toJson();
    }
    return data;
  }
}

class Rating {
  double? rate;
  int? count;

  Rating({this.rate, this.count});

  Rating.fromJson(Map<String, dynamic> json) {
    rate = json['rate'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['rate'] = rate;
    data['count'] = count;
    return data;
  }
}
