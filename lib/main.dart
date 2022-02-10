import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:society/dashboard/login_dashboard.dart';
import 'package:society/screen/home_screen.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginDashboard()),
      ],
      child: MaterialApp(
        title: 'society',
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}

