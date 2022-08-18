// ignore_for_file: prefer_const_constructors

import 'package:first_project_with_api/bloc/MainCubit.dart';
import 'package:first_project_with_api/bloc/MainState.dart';
import 'package:first_project_with_api/modle/DataBase.dart';
import 'package:first_project_with_api/screens/PageScreen.dart';
import 'package:first_project_with_api/screens/ProductScreen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../statics/asd.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    MainCubit.get(context).getGridItems();
    return BlocConsumer<MainCubit, MainState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
          ),
          appBar: AppBar(
            title: Text(
              'Home',
              style: GoogleFonts.balooBhaijaan2(
                color: Colors.grey[900],
                fontWeight: FontWeight.w700,
                fontSize: 22,
              ),
            ),
            centerTitle: true,
            actions: [
              IconButton(
                  onPressed: () {
                    MainCubit.get(context).getIdsFromDataBase();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => PageScreen()));
                  },
                  icon: Icon(
                    Icons.shopping_bag_outlined,
                    color: Colors.grey[600],
                  ))
            ],
            leading: IconButton(
                onPressed: () {
                  DataBaseClass.insertToDataBase(2);
                },
                icon: Icon(
                  Icons.format_list_bulleted_outlined,
                  color: Colors.grey[600],
                )),
          ),
          body: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                height: 10,
              ),
              Container(
                height: 35,
                width: double.infinity,
                child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                  itemCount: MainCubit.get(context).categotyMap.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (v, index) {
                    return GestureDetector(
                      child: Card(
                        elevation: 1,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(500),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: MainCubit.get(context).selectedItem == index
                                ? Colors.black45
                                : Colors.grey[200],
                            borderRadius: BorderRadius.circular(500),
                          ),
                          padding:
                              EdgeInsets.symmetric(horizontal: 9, vertical: 3),
                          child: Text(
                            MainCubit.get(context).categotyMap[index],
                            style: TextStyle(
                              color:
                                  MainCubit.get(context).selectedItem == index
                                      ? Colors.white
                                      : Colors.black,
                              fontSize: 16,
                              fontWeight:
                                  MainCubit.get(context).selectedItem == index
                                      ? FontWeight.w500
                                      : FontWeight.w300,
                            ),
                          ),
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          MainCubit.get(context).selectedItem = index;
                          MainCubit.get(context).getGridItems();
                        });
                      },
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      width: 10,
                    );
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 8, right: 8, top: 4),
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      mainAxisExtent: 280,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 10,
                    ),
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (ctx, i) => itemDesign(
                        MainCubit.get(context).gridMap[i]['images'][0],
                        MainCubit.get(context).gridMap[i]['title'],
                        0.0,
                        0.0,
                        i,
                        context),
                    itemCount: MainCubit.get(context).gridMap.length,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
