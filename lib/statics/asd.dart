// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:first_project_with_api/bloc/MainCubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../screens/ProductScreen.dart';

String BASEURL = 'https://dummyjson.com/';

Widget itemDesign(String image, String name, double price, double? discount,
        int index, BuildContext context) =>
    GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (ctx) => ProductScreen(index)));
      },
      child: Container(
        height: 250,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 220,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(5),
                      topLeft: Radius.circular(5))),
              clipBehavior: Clip.hardEdge,
              child: Image(
                image: NetworkImage(image),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 8),
              child: Text(
                name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'price',
                  style: GoogleFonts.gentiumBookBasic(
                      color: Colors.grey[800],
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(width: 5),
                Text(
                  price.toString(),
                  style: discount != null
                      ? GoogleFonts.gentiumBookBasic(
                          color: Colors.red,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          decoration: TextDecoration.lineThrough,
                        )
                      : GoogleFonts.gentiumBookBasic(
                          color: Colors.green,
                          fontSize: 15,
                          fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  discount != null ? (price - price * discount).toString() : '',
                  style: GoogleFonts.gentiumBookBasic(
                    color: Colors.green,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                Spacer(),
                GestureDetector(
                  child: Icon(Icons.favorite_border),
                  onTap: () {},
                )
              ],
            ),
          ],
        ),
      ),
    );

Widget itemDesign2(String image, String name, double price, double? discount,
        int index, BuildContext context) =>
    GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (ctx) => ProductScreen(index)));
      },
      child: Container(
        margin: EdgeInsets.only(left: index == 0 ? 16 : 0),
        height: 260,
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 230,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(5),
                      topLeft: Radius.circular(5))),
              clipBehavior: Clip.hardEdge,
              child: Image(
                image: NetworkImage(image),
                fit: BoxFit.fill,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 2),
              child: Text(
                name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'price',
                  style: GoogleFonts.gentiumBookBasic(
                      color: Colors.grey[800],
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(width: 5),
                Text(
                  price.toString(),
                  style: discount != null
                      ? TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          decoration: TextDecoration.lineThrough,
                        )
                      : TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  discount == price ? '' : discount.toString(),
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                Spacer(),
                GestureDetector(
                  child: Icon(Icons.favorite_border),
                  onTap: () {},
                )
              ],
            ),
          ],
        ),
      ),
    );

Widget itemDesignPag(int index, String image, String name, price, int count,
    BuildContext context) {
  return Center(
    child: Dismissible(
      key: Key('item ${index}'),
      child: Container(
        height: 110,
        margin: EdgeInsets.symmetric(vertical: 8),
        width: double.infinity,
        child: Row(
          children: [
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage(image),
                      fit: BoxFit.fill,
                    )),
                height: 120,
                width: 120,
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  height: 8,
                ),
                Text(
                  name,
                  style: GoogleFonts.anekGujarati(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey[800],
                    shadows: [
                      Shadow(
                          color: Colors.grey,
                          blurRadius: 40,
                          offset: Offset(1, 1))
                    ],
                  ),
                ),
                Spacer(),
                Text('Quantity',
                    style: GoogleFonts.anekGujarati(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[600],
                      shadows: [
                        Shadow(
                            color: Colors.grey,
                            blurRadius: 40,
                            offset: Offset(1, 1))
                      ],
                    )),
                SizedBox(
                  height: 8,
                ),
              ],
            ),
            Spacer(),
            Column(
              children: [
                SizedBox(
                  height: 8,
                ),
                Text(
                  '${price} £',
                  style: GoogleFonts.anekGujarati(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey[600],
                    shadows: [
                      Shadow(
                          color: Colors.grey,
                          blurRadius: 40,
                          offset: Offset(1, 1))
                    ],
                  ),
                ),
                Spacer(),
                Row(
                  children: [
                    Container(
                      height: 28,
                      child: FloatingActionButton(
                        mini: true,
                        elevation: 3,
                        onPressed: () {
                          MainCubit.get(context).MinsCount(index);
                        },
                        child: Icon(
                          Icons.remove,
                          size: 17,
                        ),
                      ),
                    ),
                    Text(
                      count.toString(),
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        shadows: [
                          Shadow(
                              color: Colors.grey,
                              blurRadius: 40,
                              offset: Offset(1, 1)),
                        ],
                      ),
                    ),
                    Container(
                      height: 28,
                      child: FloatingActionButton(
                        elevation: 3,
                        mini: true,
                        onPressed: () {
                          MainCubit.get(context).plussCount(index);
                        },
                        child: Icon(
                          Icons.add,
                          size: 17,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
              ],
            ),
            SizedBox(
              width: 8,
            ),
          ],
        ),
      ),
    ),
  );
}
