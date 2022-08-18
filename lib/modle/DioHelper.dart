import 'package:dio/dio.dart';
import '../statics/asd.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(BaseOptions(
      baseUrl: BASEURL,
      receiveDataWhenStatusError: true,
    ));
  }

  static Future<Response> getData(String url)
  async
  {
    return await dio.get(
       url,
     );

  }











}