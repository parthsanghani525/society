import 'package:flutter/material.dart';
import 'package:otp_autofill/otp_autofill.dart';
import 'package:provider/provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/provider.dart';
import 'package:society/dashboard/login_dashboard.dart';
import 'package:society/utils/color.dart';
import 'package:society/utils/images.dart';

class CheckOtp extends StatefulWidget {
  const CheckOtp({Key? key}) : super(key: key);

  @override
  _CheckOtpState createState() => _CheckOtpState();
}

class _CheckOtpState extends State<CheckOtp> {

  @override
  void initState() {
    Provider.of<LoginDashboard>(context,listen: false).readOTP();
    super.initState();
  }

  @override
  void dispose() async{
   await Provider.of<LoginDashboard>(context,listen: false).dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Consumer<LoginDashboard>(
      builder: (context, obj, child) {
        return SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 40, right: 40, top: 40, bottom: 40),
                child: Image.asset(ImageScreen.otpProgress),
              ),
              const SizedBox(height: 20),
              const Text(
                'enter your otp',
                style: TextStyle(fontSize: 15),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 5),
                child: TextFormField(
                    controller: obj.otpController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(hintText: 'enter OTP')),
              ),
              const SizedBox(height: 20),
              InkWell(
                onTap: () {
                  obj.verifyOTP(context);
                },
                child: Container(
                  height: 45,
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: ColorScreen.black),
                  child: const Center(
                    child: Text(
                      'verify',
                      style: TextStyle(
                          fontSize: 14,
                          color: ColorScreen.white,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    ));
  }
}
