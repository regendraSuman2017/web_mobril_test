


import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:web_mobril_test/core/localdatabase/database.dart';

class ProductCartListOffline {
  dynamic productId;
  String? title;
  dynamic price;
  String? description;
  String? category;
  String? image;
  dynamic quantity;


  ProductCartListOffline(
      {
        this.productId,
        this.title,
        this.price,
        this.description,
        this.category,
        this.image,
        this.quantity});

  ProductCartListOffline.empty();

  Map<String, dynamic> toMap() {
    Map map = <String, dynamic>{
      'productId': productId,
      'title': title,
      'price': price,
      'description': description,
      'category': category,
      'image': image,
      'quantity': quantity,
    };
    return map as Map<String, dynamic>;
  }

  ProductCartListOffline.fromMap(Map<String, dynamic> map) {
    productId = map['productId'];
    title = map['title'];
    price = map['price'];
    description = map['description'];
    category = map['category'];
    image = map['image']; // 0 for time in and 1 for time ou'
    quantity = map['quantity'];
  }



  Future<ProductCartListOffline> save() async{
    DbHelper dbHelper=DbHelper();
    Database? dbClient = await dbHelper.db;
    productId= await dbClient?.insert('ProductCartListOffline', toMap());
    return this;
  }

  Future<List<ProductCartListOffline>> getProduct() async{
    DbHelper dbHelper=DbHelper();
    var dbClient = await dbHelper.db;

    List<Map> maps= await dbClient!.query('ProductCartListOffline',
        columns:[
          'productId',
          'category',
          'title',
          'description',
          'image', // 0 for time in and 1 for time out
          'price',
          'quantity'
        ], orderBy: "Id asc");
    List<ProductCartListOffline> ams=[];
    if(maps.isNotEmpty){
      for (int i=0;i<maps.length;i++){
        ams.add(ProductCartListOffline.fromMap(maps[i] as Map<String, dynamic>));
      }
    }
    debugPrint(maps.toString());
    return ams;
  }

  Future<int> delete(int id) async {
    DbHelper dbHelper = DbHelper();
    var dbClient = await dbHelper.db;
    int ids = await dbClient!.delete('ProductCartListOffline', where: 'id =?', whereArgs: [id]);
    return ids;
  }




}