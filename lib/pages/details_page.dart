// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';
import '../models/catalog.dart';

class DetailsPages extends StatelessWidget {
  final Item catalog;

  const DetailsPages({super.key, required this.catalog})
      : assert(catalog != null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catalog.price}".text.bold.xl4.red700.make(),
            ElevatedButton(
              onPressed: (() {}),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(MyTheme.darkBluishColor),
                shape: MaterialStateProperty.all(StadiumBorder()),
              ),
              child: "Add to cart".text.make(),
            ).wh(110, 50)
          ],
        ).p32(),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: MyTheme.creamColor,
      body: SafeArea(
        child: Column(
          children: [
            Hero(
                    tag: Key(catalog.id.toString()),
                    child: Image.network(catalog.image))
                .h40(context),
            Expanded(
                child: VxArc(
              height: 30.0,
              arcType: VxArcType.CONVEY,
              edge: VxEdge.TOP,
              child: Container(
                color: Colors.white,
                width: context.screenWidth,
                child: Column(
                  children: [
                    catalog.name.text.xl3.bold
                        .color(MyTheme.darkBluishColor)
                        .make(),
                    catalog.desc.text.textStyle(context.captionStyle).xl.make(),
                    10.heightBox,
                    "Voluptua sadipscing sadipscing sit no voluptua no dolores aliquyam, sed diam magna dolor sanctus lorem dolore, dolore dolore kasd lorem dolores amet accusam sit, et at ipsum magna ipsum, dolor ut rebum sadipscing dolore et amet rebum. Justo duo est magna no. Et sanctus amet et stet, vero diam justo."
                        .text
                        .textStyle(context.captionStyle)
                        .make()
                        .p24()
                  ],
                ).py64(),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
