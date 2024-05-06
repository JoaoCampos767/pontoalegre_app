import 'package:flutter/material.dart';
//import 'package:pontoalegre/screen/singIn/singin.dart';
import 'package:pontoalegre/screen/initial/initial.dart';
import 'package:pontoalegre/screen/singIn/singin_provider.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SingInProvider(),
      child: MaterialApp(
        theme: ThemeData(useMaterial3: true),
        home: const InitialPage(),
      ),
    );
  }
}
