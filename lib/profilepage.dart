import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:image_picker/image_picker.dart';
import 'inputdeco.dart';
import 'pickers/user_image_picker.dart';

class MyHomePage extends StatefulWidget {


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  late String Name, Email, Phone, flatno;



  final GlobalKey<FormState> formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
        padding: const EdgeInsets.fromLTRB(10, 50, 30, 50),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              height: 40,
              width: 50,
              child:  const Center(
                child: Icon(
                  Icons.arrow_back_ios, size: 24, color: Colors.black54,),
              ),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black54),
                  borderRadius: const BorderRadius.all(
                      Radius.circular(10))),),
            const Text('Profile details',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
            const SizedBox(height: 24, width: 24)
          ],
        ),
      ),),
        body: SingleChildScrollView(
          child: profileView(),
        )
    );
  }

  Widget profileView() {
    return Form(
      key: formKey,
      child: Column(

        children: <Widget>[



          Padding(
            padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
            child: Stack(
              children:  const <Widget>[
                UserImagePicker()
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(20, 5, 20, 4),
            child: TextFormField(
              keyboardType: TextInputType.text,
              decoration: buildInputDecoration(Icons.person, " Name"),
              validator: (value){
                if(value!.isEmpty)
                {
                  return 'Please Enter Name';
                }
                return null;
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(20, 5, 20, 4),
            child: TextFormField(
              keyboardType: TextInputType.text,
              decoration: buildInputDecoration(Icons.email, " Enter Email"),
              validator: (value)
              {
                if(value!.isEmpty)
                {
                  return 'Please a Enter';
                }
                if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)){
                  return 'Please a valid Email';
                }
                return null;
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(20, 5, 20, 4),
            child: TextFormField(
              keyboardType: TextInputType.number,
              decoration: buildInputDecoration(
                  Icons.confirmation_number, "Phone No"),
              autofocus: true,
              validator: (value){
                if(value!.isEmpty)
                {
                  return 'enter phone number';
                }
                return null;
              },


            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(20, 5, 20, 4),
            child: TextFormField(
              keyboardType: TextInputType.number,
              decoration: buildInputDecoration(Icons.location_city, "Flat No"),
                validator: (value){
                  if(value!.isEmpty)
                  {
                    return 'enter flat no';
                  }
                  return null;
                }
            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(20, 5, 20, 4),
            child: TextFormField(
              keyboardType: TextInputType.number,
              decoration: buildInputDecoration(
                  Icons.directions_car, "Vehicle No"),
                validator: (value){
                  if(value!.isEmpty)
                  {
                    return 'enter vehicle no';
                  }
                  return null;
                }
            ),
          ),

          SizedBox(
            width: 200,
            height: 50,
            child:RaisedButton(
              color: Colors.redAccent,
              onPressed: (){

                if(formKey.currentState!.validate())
                {
                  print("successful");

                  return;
                }else{
                  print("UnSuccessfull");
                }
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),

                  side: BorderSide(color: Colors.blue,width: 2)
              ),
              textColor:Colors.white,child: const Text("Submit"),

            ),
          )


        ],

      ),
    );
  }


}

