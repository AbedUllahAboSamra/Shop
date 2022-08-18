// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, sort_child_properties_last

import 'package:first_project_with_api/bloc/MainCubit.dart';
import 'package:first_project_with_api/bloc/MainState.dart';
import 'package:first_project_with_api/modle/DataBase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../statics/asd.dart';

class PageScreen extends StatefulWidget {
  @override
  State<PageScreen> createState() => _PageScreenState();
}

class _PageScreenState extends State<PageScreen> {
  var cityController = TextEditingController();
  var contryController = TextEditingController();
  var streetController = TextEditingController();
  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainState>(
      listener: (ctx, state) {},
      builder: (context, state) {
        return Scaffold(
          body: NestedScrollView(
            physics: BouncingScrollPhysics(),
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              // These are the slivers that show up in the "outer" scroll view.
              return <Widget>[
                SliverAppBar(
                  centerTitle: true,
                  pinned: true,
                  title: Text(
                    'PAG',
                    style: GoogleFonts.balooBhaijaan2(
                      color: Colors.grey[900],
                      fontWeight: FontWeight.w700,
                      fontSize: 22,
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
                  elevation: .7,
                )
              ];
            },
            body: SingleChildScrollView(
              physics: NeverScrollableScrollPhysics(),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    height: 26,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Card(
                        color: MainCubit.get(context).step == 0
                            ? Colors.black
                            : Colors.grey[400],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(500),
                        ),
                        child: Container(
                          margin: EdgeInsets.all(14),
                          child: Icon(
                            Icons.shopping_cart_outlined,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Card(
                        color: MainCubit.get(context).step == 1
                            ? Colors.black
                            : Colors.grey[400],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(500),
                        ),
                        child: Container(
                          margin: EdgeInsets.all(14),
                          child: Icon(
                            Icons.location_on_outlined,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Card(
                        color: MainCubit.get(context).step == 2
                            ? Colors.black
                            : Colors.grey[400],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(500),
                        ),
                        child: Container(
                          margin: EdgeInsets.all(14),
                          child: Icon(
                            Icons.payment_outlined,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Card(
                        color: MainCubit.get(context).step == 3
                            ? Colors.black
                            : Colors.grey[400],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(500),
                        ),
                        child: Container(
                          margin: EdgeInsets.all(14),
                          child: Icon(
                            Icons.done_all_outlined,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  if (MainCubit.get(context).step == 0)
                    Container(
                      width: double.infinity,
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (ctx, index) {
                          return itemDesignPag(
                              index,
                              MainCubit.get(context).pagProdect[index]
                                  ['thumbnail'],
                              MainCubit.get(context).pagProdect[index]['title'],
                              MainCubit.get(context).pagProdect[index]
                                      ['price'] -
                                  MainCubit.get(context).pagProdect[index]
                                      ['discountPercentage'],
                              MainCubit.get(context).pagProdectCount[index],
                              context);
                        },
                        itemCount: MainCubit.get(context).pagProdect.length,
                      ),
                    )
                  else if (MainCubit.get(context).step == 1)
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                      child: Column(
                        children: [
                          Container(
                            height: 50,
                            margin: EdgeInsets.only(top: 50, bottom: 16),
                            child: TextFormField(
                              controller: contryController,
                              decoration: InputDecoration(
                                labelText: 'Country',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              maxLines: 1,
                              keyboardType: TextInputType.name,
                            ),
                          ),
                          Container(
                            height: 50,
                            margin: EdgeInsets.only(bottom: 16),
                            child: TextFormField(
                              controller: cityController,
                              decoration: InputDecoration(
                                labelText: 'City',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              maxLines: 1,
                              keyboardType: TextInputType.name,
                            ),
                          ),
                          Container(
                            height: 50,
                            margin: EdgeInsets.only(bottom: 16),
                            child: TextFormField(
                              controller: streetController,
                              decoration: InputDecoration(
                                labelText: 'Street',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              maxLines: 1,
                              keyboardType: TextInputType.name,
                            ),
                          ),
                          Container(
                            height: 50,
                            margin: EdgeInsets.only(bottom: 16),
                            child: TextFormField(
                              controller: phoneController,
                              decoration: InputDecoration(
                                labelText: 'Phone',
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              maxLines: 1,
                              keyboardType: TextInputType.name,
                            ),
                          ),
                        ],
                      ),
                    )
                  else if (MainCubit.get(context).step == 2)
                    Container(
                      height: 520,
                      child: Column(
                        children: [







                        ],
                      ),
                    ),
                  Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: MainCubit.get(context).step == 1 ? 100 : 16),
                    child: MaterialButton(
                      onPressed: () {},
                      elevation: 2,
                      height: 48,
                      child: Text(
                        MainCubit.get(context).step < 3 ? 'Next' : 'Finish',
                        style: GoogleFonts.anekGujarati(color: Colors.white),
                      ),
                      minWidth: double.infinity,
                      color: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
