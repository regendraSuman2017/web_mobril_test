

import 'package:web_mobril_test/data/model/getAllProduct_response.dart';
import 'package:web_mobril_test/data/model/get_select_product_response.dart';

abstract class HomeRepo{
  Future<List<GetAllProductResponse>?> getAllProductsAPI();
  Future<GetSelectProductResponse?> getSelectProductsAPI(int id);

}