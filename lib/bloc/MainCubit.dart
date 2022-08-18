import 'dart:ffi';

import 'package:first_project_with_api/modle/DioHelper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../modle/DataBase.dart';
import 'MainState.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainInitialeState());

  static MainCubit get(context) => BlocProvider.of(context);
  var mmap = [];
  var gridMap = [];
  var productsDataBase = [];
  List<dynamic> categotyMap = [];
  var selectedItem = 0;
  var pagProdect = [];
  var pagProdectCount = [];

  var step = 0;

  getProducts() {
    emit(MainLoaddingState());
    DioHelper.getData('products').then((value) {
      mmap = value.data['products'];
      print('getProducts');
      emit(MainSucssesState());
    }).catchError((error) {
      emit(MainErrorState(error.toString()));
      print(error.toString());
    });
  }

  getCategory() {
    emit(MainLoaddingState());
    DioHelper.getData('products/categories').then((value) {
      categotyMap = value.data;
      emit(MainSucssesState());
    }).catchError((error) {
      emit(MainErrorState(error.toString()));
      print(error.toString());
    });
  }

  getGridItems() {
    gridMap = [];

    mmap.forEach((element) {
      if (element['category'] == categotyMap[selectedItem]) {
        gridMap.add(element);
      }
    });
  }

  getIdsFromDataBase() {
    DataBaseClass.getAllIds().then((value) {
      productsDataBase = value;
      getProductsFromDataBase();
    }).catchError((e) {
      emit(MainErrorGetFromDB());
    });
  }

  getProductsFromDataBase() {
    var ae = 0;
    pagProdect.clear();
    productsDataBase.forEach((element) {
      {
        ae++;
        mmap.forEach((a) {
          {
            if (element['id'] == a['id']) {
              pagProdect.add(a);
              pagProdectCount.add(element['count']);
            }
            if (ae == productsDataBase.length - 1) {
              emit(MainSucssesGetFromDB());
            }
          }
        });
      }
    });
  }

  plussCount(int index) {
    pagProdectCount[index]++;
    DataBaseClass.updateCount(pagProdectCount[index], pagProdect[index]['id']);
    emit(MainPlusCount());
  }

  MinsCount(int index) {
    pagProdectCount[index] == 1 ? null : pagProdectCount[index]--;
    DataBaseClass.updateCount(pagProdectCount[index], pagProdect[index]['id']);
    emit(MainMinsCount());
  }

  nextStep() {
    step++;
    emit(MainChangeStepCount());
  }
}
