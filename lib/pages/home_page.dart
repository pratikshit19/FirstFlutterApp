// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flutter/src/material/colors.dart';
import 'package:flutter_application_1/models/catalog.dart';
import '../widgets/drawer.dart';
import '../widgets/item_widget.dart';

class Homepage extends StatefulWidget {
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final int days = 30;

  final String name = "Pratikshit";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    //await Future.delayed(Duration(seconds: 1));
    final catalogjason =
        await rootBundle.loadString("assets/files/catalo.json");
    final decodedData = jsonDecode(catalogjason);
    var productsData = decodedData["products"];
    CatalogModel.items =
        List.from(productsData).map((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog App"),
      ),
      body: Padding(
          padding: const EdgeInsets.all(22.0),
          child: (CatalogModel.items.isNotEmpty) //CatalogModel.items != null
              ? GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16),
                  itemBuilder: (context, index) {
                    final item = CatalogModel.items[index];
                    return Card(
                      clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(                   
                            borderRadius: BorderRadius.circular(10)),
                        child: GridTile(
                            header: Container(
                              child: Text(item.name, style: TextStyle(color: Colors.white),),
                              padding: const EdgeInsets.all(12),
                              decoration:
                                  BoxDecoration(color: Colors.blueGrey[500]),
                            ),
                            footer: Container(
                              child: Text(item.price.toString(), style: TextStyle(color: Colors.white),),
                              padding: const EdgeInsets.all(12),
                              decoration:
                                  BoxDecoration(color: Colors.black),
                            ),
                            child: Image.network(item.image)));
                  },
                  itemCount: CatalogModel.items.length,
                )
              : Center(
                  child: CircularProgressIndicator(),
                )),
      drawer: MyDrawer(),
    );
  }
}
