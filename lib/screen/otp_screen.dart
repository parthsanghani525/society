import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:society/dashboard/login_dashboard.dart';
import 'package:society/utils/color.dart';
import 'package:society/utils/images.dart';
import 'package:society/utils/string.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController numberController = TextEditingController(text: '+91');
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<LoginDashboard>(
        builder: (context,obj,child){
          return Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                   Padding(
                     padding: const EdgeInsets.only(left: 40,right: 40,top: 40),
                     child:  Image.asset(ImageScreen.otpImage),
                   ),
                   const SizedBox(height: 20,),
                   const Text(StringScreen.otpVerify,style: TextStyle(fontSize: 30,fontWeight: FontWeight.w500),),

                   Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 30),
                     child: TextFormField(
                       controller: numberController,
                       keyboardType: TextInputType.phone,
                       decoration: InputDecoration(
                         border: OutlineInputBorder(
                             borderRadius: BorderRadius.circular(15)),
                         hintText: StringScreen.numberValidation,
                         hintStyle: const TextStyle(fontSize: 18,fontWeight: FontWeight.w600),
                       ),
                       validator: (value){
                         if(value!.isEmpty){
                           return  StringScreen.numberValidation;
                         }
                         else if(value.length !=  13){
                           return StringScreen.validNumberError;
                         }
                         else{
                           return null ;
                         }
                       },
                     ),
                   ),
                   InkWell(
                     onTap: ()async{
                       if (_formKey.currentState!.validate()){
                         Fluttertoast.showToast(
                             msg: "success",
                             toastLength: Toast.LENGTH_SHORT,
                             gravity: ToastGravity.TOP,
                             timeInSecForIosWeb: 3,
                             backgroundColor: Colors.red,
                             textColor: Colors.white,
                             fontSize: 16.0);

                        await obj.registerUser(numberController.text,context);
                        await  obj.otpBtn(context);
                       }
                       else{
                         Fluttertoast.showToast(
                             msg: "some thing is wrong",
                             toastLength: Toast.LENGTH_SHORT,
                             gravity: ToastGravity.TOP,
                             timeInSecForIosWeb: 3,
                             backgroundColor: Colors.red,
                             textColor: Colors.white,
                             fontSize: 16.0);
                       }

                     },
                     child: Container(
                       margin: const EdgeInsets.symmetric(horizontal: 40),
                       width: MediaQuery.of(context).size.width,
                       //width: 200,
                       height: 45,
                       decoration:  BoxDecoration(
                         color: ColorScreen.blue,
                         borderRadius: BorderRadius.circular(15)
                       ),
                       child: const Center(
                         child: Text(StringScreen.getOtp,style: TextStyle(fontSize: 20,color: ColorScreen.white,fontWeight: FontWeight.w600 ),),
                       ),
                     ),
                   )
                 ],
              ),
            ),
          );
        },
      ),
    );
  }
}
