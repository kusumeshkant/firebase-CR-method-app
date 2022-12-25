import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/model/data_model.dart';

class DataService {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  List<OrderModel> orderlist = [];
  String res = "error";
  Future<String> createOrder(
    String recipeName,
    String userName,
  ) async {
    res = 'error';
    try {
      OrderModel orderModel =
          OrderModel(recipeName: recipeName, userName: userName);
      await firebaseFirestore
          .collection("order_List")
          .doc()
          .set(orderModel.toJson());
      res = "success";
    } catch (e) {
      res = e.toString();
      log("res :- $res");
    }
    return res;
  }

// get data //

  Stream<List<OrderModel>> getOrder() => FirebaseFirestore.instance
      .collection("order_List")
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => OrderModel.fromJson(doc.data())).toList());
}
