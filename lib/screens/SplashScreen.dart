import 'package:first_project_with_api/bloc/MainCubit.dart';
import 'package:first_project_with_api/bloc/MainState.dart';
import 'package:first_project_with_api/screens/MainScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splashscreen/splashscreen.dart';

class SplasahScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit,MainState>(
        listener: (ctx, state) {
          if(state is MainSucssesState){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>MainScreen()));
          }
        },
        builder: (context, state) {
        return Scaffold(

        );
      },
    );
  }
}
