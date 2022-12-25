import 'package:flutter/material.dart';
import 'package:flutter_application_1/Ui/Auth_screen/widgets/button.dart';
import 'package:flutter_application_1/Ui/receipt/widgets/textField.dart';
import 'package:flutter_application_1/utilities/assets_list.dart';
import 'package:flutter_application_1/utilities/h_spacer.dart';
import 'package:flutter_application_1/utilities/screen_sizer.dart';

import '../../services/data_service.dart';

class Receipt extends StatefulWidget {
  const Receipt({super.key});

  @override
  State<Receipt> createState() => _ReceiptState();
}

class _ReceiptState extends State<Receipt> {
  DataService dataService = DataService();

  TextEditingController nameController = TextEditingController();
  TextEditingController recipeNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: screenHeight(context),
        width: screenWidth(context),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(AssetsList.cookingImage1), fit: BoxFit.fill)),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 16,
              right: 22,
            ),
            child: EntryField(
              controller: nameController,
              labelTxt: 'Your Name.',
              text: '',
            ),
          ),
          const HSpacer(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 16,
              right: 22,
            ),
            child: EntryField(
              controller: recipeNameController,
              labelTxt: 'Recipe.',
              text: '',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
            child: Button(
                onTap: () async {
                  await dataService.createOrder(
                      recipeNameController.text, nameController.text);
                  recipeNameController.clear();
                  nameController.clear();
                  Navigator.pop(context);
                },
                lable: "Done"),
          )
        ]),
      ),
    );
  }
}
