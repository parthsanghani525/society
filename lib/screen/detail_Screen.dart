import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:society/dashboard/parking_model.dart';
import 'package:society/dashboard/services.dart';
import 'package:society/dashboard/user_model.dart';
import 'package:society/screen/dashboard_screen.dart';

Services userService = Services();

class DetailScreen extends StatefulWidget {
 String? uname;
 String? contact;
 String? flatno;




 DetailScreen({this.uname, this.contact, this.flatno});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  String id = '';
  QuerySnapshot? questionSnaphot;
  ParkingModel model = ParkingModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.uname.toString()),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: StreamBuilder<List<ParkingModel>>(
          stream: Services.getUserParkingData("j1QJoqX6kcg29a3rOaiS"),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              print(snapshot.hasData.toString());
              if (snapshot.data == null || snapshot.data!.isEmpty) {
                print(snapshot.data!.isEmpty.toString());
                return Center(child: Text('Data  is Empty'));
              } else {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (_, int index) {
                    ParkingModel data = snapshot.data![index];

                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.shade400,
                                  spreadRadius: 1,
                                  blurRadius: 2,
                                  offset: Offset(0.1, 0.1))
                            ]),
                        child: Column(
                          children: [

                            Text(data.vechilePlateNumber.toString()),
                            SizedBox(height: 4),
                            data.vechileType == 0
                                ? Text('Four- wheel')
                                : Text('two- wheel'),
                            SizedBox(height: 4),
                            data.parkingType == 0 ? Text('ground') : Text('Baseman')
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
