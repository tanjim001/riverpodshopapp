import 'package:dio/dio.dart';
import 'package:elearnapp/global/global.dart';

class HttpUtil {
  late Dio dio;
  static final HttpUtil _instance = HttpUtil._internal();

  factory HttpUtil() {
    return _instance;
  }

  HttpUtil._internal() {
  BaseOptions baseoption=  BaseOptions(
        baseUrl: "http://",
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 5),
        contentType: "application/json: charset=utf-8",
        responseType: ResponseType.json,
        headers: {});
        dio=Dio(baseoption);
  }
  Map<String,dynamic>?getAuthorizationHeader(){
    var headers=<String,dynamic>{};
    var accessToken=Global.storageServie.getUserToken();
    if(accessToken.isNotEmpty){
      headers['Authorization']='Bearer $accessToken';
    }
    return headers;
  }
}
