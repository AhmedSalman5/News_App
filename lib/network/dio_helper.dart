import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static init(){
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://newsapi.org/',
        //  هات الداتا حتي لو ال State Error يعني لو حصل ايرور والداتا راجعه
        receiveDataWhenStatusError: true,
      ),
    );
  }


  static Future<Response> getData({
    required String url,
    required  Map<String, dynamic>? query,
})async{
   return await dio.get(url,queryParameters: query);
  }

}