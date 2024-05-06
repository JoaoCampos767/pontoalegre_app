import 'package:flutter/material.dart';
import 'package:pontoalegre/screen/singIn/singin.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.account_circle)),
              Tab(icon: Icon(Icons.person_add)),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            SingIn(),
            Icon(Icons.directions_transit),
          ],
        ),
      ),
    );
  }
}
