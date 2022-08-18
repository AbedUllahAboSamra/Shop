import 'package:first_project_with_api/modle/DataBase.dart';
import 'package:first_project_with_api/modle/DioHelper.dart';
import 'package:first_project_with_api/screens/MainScreen.dart';
import 'package:first_project_with_api/screens/PageScreen.dart';
import 'package:first_project_with_api/screens/ProductScreen.dart';
import 'package:first_project_with_api/screens/SplashScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/MainCubit.dart';
import 'bloc/MainState.dart';

void main() {
WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  DataBaseClass.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (c) => MainCubit()..getProducts()..getCategory(),
        child: BlocConsumer<MainCubit, MainState>(
          listener: (ctx, state) {},
          builder: (ctx, state) {
            return MaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData(
                primaryColor: Colors.black,
                accentColor: Colors.black,
                canvasColor: Colors.white,
                iconTheme: IconThemeData(
                  color: Colors.grey[600],
                ),
                appBarTheme: AppBarTheme(
                  color: Colors.white,
                  elevation: 1.5,
                ),
              ),
              themeMode: ThemeMode.light,
              home: MainScreen(),
            );
          },
        ));
  }
}
