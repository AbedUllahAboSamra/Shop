// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:first_project_with_api/bloc/MainCubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';

import '../statics/asd.dart';

class ProductScreen extends StatefulWidget {
  final int index;

  ProductScreen(this.index);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final _pageViewController =
      PageController(initialPage: 0, viewportFraction: 0.75);
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    List images = MainCubit.get(context).gridMap[widget.index]['images'];
    return Scaffold(
      appBar: AppBar(
        elevation: 0.8,
        title: Container(
          margin: EdgeInsets.only(top: 2),
          child: Text(
            MainCubit.get(context).gridMap[widget.index]['category'],
            style: GoogleFonts.balooBhaijaan2(
              color: Colors.grey[900],
              fontWeight: FontWeight.w700,
              fontSize: 22,
            ),
          ),
        ),
        leading: IconButton(
          iconSize: 20,
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 350,
              margin: EdgeInsets.only(top: 16, bottom: 5),
              child: PageView.builder(
                  controller: _pageViewController,
                  itemCount: images.length,
                  physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  onPageChanged: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    final image = images[index];
                    var _scale = _currentIndex == index ? 1.0 : 0.8;
                    return TweenAnimationBuilder(
                        tween: Tween(begin: _scale, end: _scale),
                        duration: const Duration(milliseconds: 350),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                                image: NetworkImage(image), fit: BoxFit.cover),
                          ),
                        ),
                        builder: (context, double value, child) {
                          return Transform.scale(
                            scale: value,
                            child: child,
                          );
                        });
                  }),
            ),
            SizedBox(
              height: 20,
            ),
            Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Container(
                  margin: EdgeInsets.only(left: 14),
                  child: Text(
                    MainCubit.get(context).gridMap[widget.index]['title'],
                    style: GoogleFonts.gentiumBookBasic(
                        color: Colors.grey[900],
                        fontWeight: FontWeight.w600,
                        shadows: [
                          Shadow(
                              color: Colors.grey,
                              offset: Offset(1, 5),
                              blurRadius: 50)
                        ],
                        fontSize: 22),
                  )),
              Spacer(),
              Container(
                  width: 46,
                  margin: EdgeInsets.only(right: 16, bottom: 1),
                  child: FloatingActionButton(
                    onPressed: () {},
                    backgroundColor: Colors.grey[300],
                    child: Icon(
                      Icons.shopping_cart,
                      size: 20,
                      color: Colors.black,
                    ),
                    elevation: 2,
                  )),
            ]),
            Container(
              margin: EdgeInsets.only(left: 16,top: 8),
              child: Row(
                children: [
                  Text(
                    'price',
                    style: GoogleFonts.gentiumBookBasic(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      shadows: [
                        Shadow(
                            color: Colors.grey,
                            offset: Offset(1, 5),
                            blurRadius: 50)
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    "${MainCubit.get(context).gridMap[widget.index]['price']}£",
                    style: GoogleFonts.gentiumBookBasic(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.red,
                      decoration: TextDecoration.lineThrough,
                      shadows: [
                        Shadow(
                            color: Colors.grey,
                            offset: Offset(1, 5),
                            blurRadius: 50)
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    "${MainCubit.get(context).gridMap[widget.index]['price'] - MainCubit.get(context).gridMap[widget.index]['discountPercentage']}£",
                    style: GoogleFonts.gentiumBookBasic(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.green,
                      shadows: [
                        Shadow(
                            color: Colors.grey,
                            offset: Offset(1, 5),
                            blurRadius: 50)
                      ],
                    ),
                  ),
                  Spacer(),
                  Container(
                    margin: EdgeInsets.only(right: 16, bottom: 3),
                    child: RatingBarIndicator(
                      itemBuilder: (a, s) {
                        return Icon(
                          Icons.star,
                          color: Colors.black,
                        );
                      },
                      itemCount: 5,
                      rating: MainCubit.get(context).gridMap[widget.index]
                          ['rating'],
                      itemSize: 23,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.only(left: 16, right: 16),
              child: Text(
                MainCubit.get(context).gridMap[widget.index]['description'],
                style: GoogleFonts.gentiumBookBasic(
                    fontSize: 16,
                    color: Colors.grey[800],
                    fontWeight: FontWeight.w600,
                    shadows: [Shadow(color: Colors.grey, blurRadius: 70)]),
              ),
            ),
            Container(
              height: 1,
              width: double.infinity,
              margin: EdgeInsets.only(
                top: 16,
                left: 16,
                right: 16,

              ),
              color: Colors.grey[400],
            ),
            Container(
              margin: EdgeInsets.only(left: 16, right: 16, top: 16),
              child: Text(
                "Suggestions",
                style: GoogleFonts.gentiumBookBasic(
                    fontSize: 24,
                    color: Colors.grey[800],
                    fontWeight: FontWeight.w700,
                    shadows: [Shadow(color: Colors.grey, blurRadius: 70)]),
              ),
            ),
            Container(
               width: double.infinity,
              margin: EdgeInsets.only(top: 16),
            height: 300,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (ctx, i) => itemDesign2(
                      MainCubit.get(context).mmap[i]['images'][0],
                      MainCubit.get(context).mmap[i]['title'],
                      double.parse(MainCubit.get(context).mmap[i]['price'].toString()),
                      double.parse('${MainCubit.get(context).mmap[i]['price']-MainCubit.get(context).mmap[i]['discountPercentage']}'),
                      i,
                      context),
                  itemCount: 5,
                  separatorBuilder: (ctx , i )=>SizedBox(width: 20,),
                ),
            ),
          ],
        ),
      ),
    );
  }
}

///#
///RatingBarIndicator(
//                   rating: 2.75,
//                   itemBuilder: (context, index) => Icon(
//                     Icons.star_rounded,
//                     color: Colors.black,
//                   ),
//
//                   itemCount: 5,
//                   itemSize: 28.0,
//                   direction: Axis.horizontal
//                 ),
