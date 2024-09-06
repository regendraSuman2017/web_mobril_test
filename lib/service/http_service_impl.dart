import 'dart:async';
import 'package:dio/dio.dart';
import 'package:web_mobril_test/core/url_constant.dart';
import 'package:web_mobril_test/service/http_service.dart';

class HttpServiceImpl implements HttpService {
  late Dio _dio;


  @override
  void init() {
    _dio = Dio(BaseOptions(baseUrl: UrlConstant.baseUrl));
  }


  @override
  Future<Response> getAllProductsRequest() async {
    Response response;
    try {
      response = await _dio.get(UrlConstant.getAllProducts);
      print("lkajsdlk ${response}");
    } on DioException catch (e) {
      print("sdjksdjkjdk 1");
      throw Exception(e.message);
    }
    return response;
  }

  @override
  Future<Response> getSelectProductsRequest(int id) async {
    Response response;
    try {
      print("dsljlk ${UrlConstant.baseUrl+UrlConstant.getAllProducts+'/$id'}");
      response = await _dio.get('${UrlConstant.getAllProducts}/$id');

    } on DioException catch (e) {
      throw Exception(e.message);
    }
    return response;
  }

}
