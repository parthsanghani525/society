import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:society/dashboard/login_dashboard.dart';
import 'package:society/utils/color.dart';
import 'package:society/utils/images.dart';
import 'package:society/utils/string.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Consumer<LoginDashboard>(
      builder: (context, obj, child) {
        return Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 50,right: 50,top: 80),
              child: Text(StringScreen.signUp,style: TextStyle(fontSize: 60),),
            ),
            Container(
                margin: const EdgeInsets.only(left: 50, right: 40, top: 40),
                height: 180,
                width: 180,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(150),
                    gradient: const LinearGradient(
                        colors: [ColorScreen.pink, ColorScreen.purple]),
                    boxShadow: const [
                      BoxShadow(
                          color: ColorScreen.grey,
                          offset: Offset(2, 2),
                          blurRadius: 11)
                    ]),
                child: Image.asset(ImageScreen.profileImage)),
            const SizedBox(height: 100),
            InkWell(
              onTap: (){
                obj.btn(context);
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 40),
                height: 45,
                width: MediaQuery.of(context).size.width - 100,
                decoration: BoxDecoration(
                  color: ColorScreen.black,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Center(
                    child: Text(
                  StringScreen.loginWithNumber,
                  style: TextStyle(
                      fontSize: 16,
                      color: ColorScreen.white,
                      fontWeight: FontWeight.w600,
                      wordSpacing: 1),
                )),
              ),
            )
          ],
        );
      },
    ));
  }
}
