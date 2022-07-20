import 'package:develocity/constants/network/network_services.dart';
import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: BaseUrl,
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    String? token,
    Map<String, dynamic>? query,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'Authorization': token,
    };

    return await dio.get(url, queryParameters: query);
  }

  static Future<Response> postData(
      {required String url,
      required Map<String, dynamic> data,
      String? token,
      Map<String, dynamic>? query}) async {
    return await dio.post(
      url,
      data: data,
      queryParameters: query,
      options: Options(
          followRedirects: false,
          // will not throw errors
          validateStatus: (status) => true,
          headers: {
            'Content-Type': 'application/json',
            'Authorization': token,
          }),
    );
  }

  // static Future<Response> postDataWithImage(
  //     {required String url,
  //     required FormData data,
  //     String? token,
  //     Map<String, dynamic>? query}) async {
  //   return await dio.post(
  //     url,
  //     data: data,
  //     options: Options(
  //         followRedirects: false,
  //         validateStatus: (status) => true,
  //         headers: {
  //           'Content-Type':
  //               'multipart/form-data; boundary=<calculated when request is sent>',
  //           'Authorization': token,
  //           "Accept": "*/*"
  //         }),
  //     queryParameters: query,
  //   );
  // }
}
