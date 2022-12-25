import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/data_model.dart';
import 'package:flutter_application_1/services/data_service.dart';
import 'package:flutter_application_1/utilities/assets_list.dart';
import 'package:flutter_application_1/utilities/h_spacer.dart';
import 'package:flutter_application_1/utilities/screen_sizer.dart';
import 'package:flutter_application_1/utilities/textStyles.dart';

import '../receipt/receipt.dart';

class HomeList extends StatefulWidget {
  const HomeList({super.key});

  @override
  State<HomeList> createState() => _HomeListState();
}

class _HomeListState extends State<HomeList> {
  DataService dataService = DataService();
  final user = FirebaseAuth.instance.currentUser;

  var data;
  @override
  void initState() {
    dataService.getOrder();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Receipt()));
        },
        child: const Icon(Icons.add),
      ),
      body: Container(
        height: screenHeight(context),
        width: screenWidth(context),
        padding: const EdgeInsets.only(left: 12, right: 12),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AssetsList.backGroundImage),
                fit: BoxFit.cover)),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HSpacer(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Hey ${user!.displayName}",
                      style:
                          TextStyles.inter600_18.copyWith(color: Colors.white),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(user!.photoURL!),
                      ),
                    )
                  ],
                ),
                const Divider(
                  thickness: 1.7,
                  color: Colors.white,
                ),
                Text(
                  "Your Order List",
                  style: TextStyles.inter600_18.copyWith(color: Colors.white),
                ),
                const HSpacer(
                  height: 20,
                ),
                SizedBox(
                    height: screenHeight(context) * .8,
                    width: screenWidth(context),
                    child: StreamBuilder<List<OrderModel>>(
                      stream: dataService.getOrder(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          data = snapshot.data!;
                          log("data :- ${snapshot.data![0].recipeName}");
                          return ListView.builder(
                              itemCount: data.length,
                              itemBuilder: ((context, index) {
                                log("data1 :- ${snapshot.data![0].recipeName}");
                                return Column(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(top: 8.0),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.cyan.withOpacity(.2),
                                      ),
                                      child: ListTile(
                                        leading: const CircleAvatar(
                                          radius: 20,
                                          backgroundImage:
                                              AssetImage(AssetsList.dishImage),
                                        ),
                                        title: Text(
                                          "Order Name:- ${data[index].recipeName}",
                                          style: TextStyles.inter600_15
                                              .copyWith(color: Colors.white),
                                        ),
                                        subtitle: Text(
                                          "Order by:- ${data[index].userName}",
                                          style: TextStyles.inter600_15
                                              .copyWith(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                    const Divider(
                                      thickness: 1,
                                      color: Colors.white,
                                    ),
                                  ],
                                );
                              }));
                        } else if (snapshot.hasError) {
                          return const Center(
                            child: Text(" No Order Listed"),
                          );
                        }
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
