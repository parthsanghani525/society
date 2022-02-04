import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:otp_autofill/otp_autofill.dart';
import 'package:society/screen/home_screen.dart';
import 'package:society/screen/number_verify.dart';
import 'package:society/screen/otp_screen.dart';

class LoginDashboard extends ChangeNotifier {
   late OTPTextEditController otpController;


 String verificationIdReceived = '';
 String? uid;
 bool otpSent = true;
 late OTPInteractor otpInteractor;

  void btn(context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const OtpScreen(),
      ),
    );
  }

  Future? otpBtn(context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const CheckOtp(),
      ),
    );
  }
 
    void verifyOTP (BuildContext context) async{
    final credential = PhoneAuthProvider.credential(verificationId: verificationIdReceived, smsCode: otpController.text);
    
    try{
      await FirebaseAuth.instance.signInWithCredential(credential);
      if(FirebaseAuth.instance.currentUser != null){
        uid = FirebaseAuth.instance.currentUser!.uid;
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ),
        );
      }
    }
    catch(e){
      print(e);
    }
    }
  
  Future registerUser(String number, BuildContext context) async {
    FirebaseAuth _auth = FirebaseAuth.instance;

    await _auth.verifyPhoneNumber(
      phoneNumber: number,
      timeout: const Duration(seconds: 60),


      verificationCompleted: (PhoneAuthCredential credential){
          _auth.signInWithCredential(credential);
          if(_auth.currentUser != null){
            uid = _auth.currentUser!.uid;
          }
          else{
            print('failed to sign in ');
          }
          notifyListeners();
        },

      verificationFailed: (FirebaseAuthException exception) {
        print(exception.message);
      },

      codeSent: (String verificationId, [int? resendToken]) async {

         verificationIdReceived = verificationId;
         otpSent = true;
         notifyListeners();
        },

      codeAutoRetrievalTimeout: (String verificationId) {
        verificationIdReceived = verificationId;
        otpSent = true ;
        print('verificationId = $verificationId');
        print("Timout");
        notifyListeners();
      },
    );
  }

  Future? readOTP (){
    otpInteractor = OTPInteractor();
    otpInteractor
        .getAppSignature()
        .then((value) => print('signature - $value'));
    otpController =  OTPTextEditController(
        codeLength: 6,
      onCodeReceive: (code) => print('Your Application receive code - $code'),
      otpInteractor: otpInteractor,
    )..startListenUserConsent(
        (code){
          final exp = RegExp(r'(\d{5})');
          return exp.stringMatch(code ?? '') ?? '';
        },
      /*  strategies: [
          SampleStrategy(),
        ]*/
    );
  }
  Future dispose ()async{
    await otpController.stopListen();
  }
}

class SampleStrategy extends OTPStrategy {
  @override
  Future<String> listenForCode() {
    return Future.delayed(
       const Duration(seconds: 5),()=> 'Your code is 54321',
    );
  }
}
