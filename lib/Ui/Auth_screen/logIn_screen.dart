import 'package:flutter/material.dart';
import 'package:flutter_application_1/Ui/Auth_screen/widgets/button.dart';
import 'package:flutter_application_1/Ui/home.dart/home_list.dart';
import 'package:flutter_application_1/utilities/assets_list.dart';
import 'package:flutter_application_1/utilities/h_spacer.dart';
import 'package:flutter_application_1/utilities/screen_sizer.dart';
import 'package:flutter_application_1/utilities/textStyles.dart';
import 'package:provider/provider.dart';

import '../../services/firebase.dart/googeSignIn.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: screenHeight(context),
        width: screenWidth(context),
        padding: const EdgeInsets.symmetric(
          horizontal: 18,
        ),
        decoration: BoxDecoration(
          image: const DecorationImage(
              image: AssetImage(AssetsList.woodImage2), fit: BoxFit.fill),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          HSpacer(
            height: screenHeight(context) * .15,
          ),
          Center(
            child: Container(
              height: 240,
              width: 400,
              decoration: BoxDecoration(
                color: Colors.red,
                image: const DecorationImage(
                    image: AssetImage(AssetsList.cookingImage),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          const HSpacer(
            height: 40,
          ),
          Text(
            "Hello There",
            style: TextStyles.inter500_20.copyWith(color: Colors.white),
          ),
          Text(
            "Welcome to cooking App",
            style: TextStyles.inter500_20.copyWith(color: Colors.white),
          ),
          const HSpacer(
            height: 10,
          ),
          Text(
            "Login to your account to continue",
            style: TextStyles.inter400_15.copyWith(color: Colors.white),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, top: 50, right: 30),
            child: Button(
              onTap: () async {
                final login =
                    Provider.of<GoogleSignInp>(context, listen: false);
                await login.googleLogIn();

                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const HomeList()));
              },
              lable: "Sign Up with Google",
            ),
          ),
          const HSpacer(
            height: 20,
          ),
          Center(
            child: RichText(
                text: const TextSpan(
                    text: 'Already have an account? ',
                    children: [
                  TextSpan(
                      text: "Login",
                      style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline))
                ])),
          )
        ]),
      ),
    );
  }
}
