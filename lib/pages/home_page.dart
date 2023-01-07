// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/material/colors.dart';
import '../widgets/drawer.dart';

class Homepage extends StatelessWidget {
  final int days = 30;
  final String name = "Pratikshit";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog App"),
      ),
      body: Center(
        child: Container(
            child: Text("welcomeee to $days days of flutter by $name")),
      ),
      drawer: MyDrawer(),
    );
  }
}
