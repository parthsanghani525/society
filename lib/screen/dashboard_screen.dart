import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:society/dashboard/services.dart';
import 'package:society/dashboard/user_model.dart';
import 'package:society/provider/user_list_provider.dart';
import 'package:society/screen/detail_Screen.dart';
import 'package:society/utils/constant.dart';

Services userService = Services();

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  static const textSecondaryColor = Color(0xFF757575);
  static const textPrimaryColor = Color(0xFF2E3033);
   final uid1 = FirebaseAuth.instance.currentUser;


  @override
  void initState() {
    super.initState();
    print(uid1.toString());

  }

  @override
  Widget build(BuildContext context) {
    UserListProvider userProvider = Provider.of<UserListProvider>(context);
    var userId  = uid1.toString();

    return Scaffold(
      appBar: AppBar(
        title: Text('HomeScreen'),
        backgroundColor: Colors.orange,
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: StreamBuilder<List<UserModel>>(
          stream: Services.getData(userId),
          builder: (BuildContext context, snap) {
            if (snap.hasData) {
              if (snap.data!.isEmpty) {
                return Center(child: Text('Data is Empty'));
              }
              return ListView.builder(
                itemCount: snap.data!.length,
                itemBuilder: (context, index) {
                  UserModel data = snap.data![index];

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => DetailScreen(
                                    uname: data.uname,
                                    contact: data.contactNo,
                                    flatno: data.flatNo,
                                  )));
                    },
                    child: Padding(
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
                          ],
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 60.0,
                                  height: 60.0,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: NetworkImage(data.avatar!),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 8),
                                Column(
                                  children: [
                                    Text(
                                      data.uname.toString(),
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      data.email.toString(),
                                      style: TextStyle(
                                        color: textSecondaryColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Flat No : ",
                                      style: TextStyle(
                                        color: textPrimaryColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Text(
                                      data.flatNo.toString(),
                                      style: TextStyle(
                                        color: textSecondaryColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Contact : ",
                                      style: TextStyle(
                                        color: textPrimaryColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Text(
                                      data.contactNo.toString(),
                                      style: TextStyle(
                                        color: textSecondaryColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                        // child: ListTile(
                        //   leading: ClipRRect(
                        //       borderRadius: BorderRadius.circular(8),
                        //       child: Image.network(
                        //         data.avatar!,
                        //         height: 120,
                        //         width: 100,
                        //         fit: BoxFit.cover,
                        //       )),
                        //   title: Column(
                        //     children: [
                        //       Text(data.uname.toString(),
                        //           style: TextStyle(
                        //               fontSize: 16,
                        //               color: Colors.black,
                        //               fontWeight: FontWeight.bold)),
                        //       SizedBox(height: 4),
                        //       Text(data.email.toString(),
                        //           style: TextStyle(
                        //               fontSize: 16,
                        //               color: Colors.black,
                        //               fontWeight: FontWeight.bold)),
                        //       SizedBox(height: 4),
                        //       Text(data.flatNo.toString(),
                        //           style: TextStyle(
                        //               fontSize: 16,
                        //               color: Colors.black,
                        //               fontWeight: FontWeight.bold)),
                        //       SizedBox(height: 4),
                        //       Text(data.contactNo.toString(),
                        //           style: TextStyle(
                        //               fontSize: 16,
                        //               color: Colors.black,
                        //               fontWeight: FontWeight.bold)),
                        //       SizedBox(height: 4),
                        //     ],
                        //   ),
                        // ),
                      ),
                    ),
                  );
                },
              );
            }
            ;
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
