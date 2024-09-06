import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:web_mobril_test/core/url_constant.dart';
import 'package:web_mobril_test/data/model/getAllProduct_response.dart';
import 'package:web_mobril_test/data/model/get_select_product_response.dart';

class ApiService {

  Future<GetAllProductResponse> getAllProductsRequest() async {
    final response = await http.get(Uri.parse('${UrlConstant.baseUrl}${UrlConstant.getAllProducts}'));
    Map<String, dynamic> responseMap = Map.from(jsonDecode(response.body.toString()));
    return GetAllProductResponse.fromJson(responseMap);
  }

  Future<GetSelectProductResponse> getSelectProductsRequests(int id) async {
    final response = await http.get(Uri.parse('${UrlConstant.baseUrl}${UrlConstant.getAllProducts}/$id'));
    Map<String, dynamic> responseMap = Map.from(jsonDecode(response.body.toString()));
    return GetSelectProductResponse.fromJson(responseMap);
  }

  Future<GetAllProductResponse> getCategoryWiseRequest(String category) async {
    final response = await http.get(Uri.parse('${UrlConstant.baseUrl}${UrlConstant.categoryWise}?type=$category'));
    Map<String, dynamic> responseMap = Map.from(jsonDecode(response.body.toString()));
    return GetAllProductResponse.fromJson(responseMap);
  }


}