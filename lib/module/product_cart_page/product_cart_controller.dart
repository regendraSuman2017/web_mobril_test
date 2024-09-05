import 'package:get/get.dart';
import 'package:web_mobril_test/data/model/getAllProduct_response.dart';
import 'package:web_mobril_test/localdatabase/product_cart_list.dart';

class ProductCartController extends GetxController {

  RxBool isLoading = true.obs;
@override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
      getProduct();
  }

RxList<ProductCartListOffline> productList = <ProductCartListOffline>[].obs;

getProduct() async {
 isLoading.value=true;
    ProductCartListOffline getProducts = ProductCartListOffline.empty();
     productList.value = await getProducts.getProduct();
 isLoading.value=false;
  }

  deleteItem(int id) async {
    ProductCartListOffline deleteP = ProductCartListOffline.empty();
     await deleteP.delete(id);
  }

  var isInCart = false.obs;
  var isInWishList = false.obs;
  RxInt totalPrice = 0.obs;





}
