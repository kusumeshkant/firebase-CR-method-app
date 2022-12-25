import 'package:cloud_firestore/cloud_firestore.dart';

class OrderModel {
  String id;
  String userName;
  String recipeName;
  OrderModel({
    this.id = "",
    required this.recipeName,
    required this.userName,
  });

  Map<String, dynamic> toJson() => {
        "id": id,
        "userName": userName,
        "recipeName": recipeName,
      };

  static OrderModel fromSnap(DocumentSnapshot snap) {
    var snapShot = snap.data() as Map<String, dynamic>;
    return OrderModel(
      id: snapShot['id'],
      userName: snapShot['userName'],
      recipeName: snapShot['recipeName'],
    );
  }

  static OrderModel fromJson(Map<String, dynamic> json) => OrderModel(
      id: json["id"],
      recipeName: json["recipeName"],
      userName: json["userName"]);
}
