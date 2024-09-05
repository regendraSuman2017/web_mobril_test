

import 'package:hive/hive.dart';
import 'package:get/get.dart';
import 'package:web_mobril_test/data/model/getAllProduct_response.dart';

class ProductCartController extends GetxController {




  var isInCart = false.obs;
  var isInWishList = false.obs;
  RxInt totalPrice = 0.obs;

  var items = List<GetAllProductResponse>.empty().obs;

  List<GetAllProductResponse> cartProducts = <GetAllProductResponse>[];

  @override
  void onInit() async{
    super.onInit();
    getItems();

  }


  Future getItems() async {
    Box box;
    try {
      box = Hive.box('cart');
    } catch (error) {
      box = await Hive.openBox('cart');
      print(error);
    }
    var items = box.get('cart_items');
    if (items != null) this.items.value = items;


    print("dasldjkkl ${items.length}");
  }


  addToCart(GetAllProductResponse itemModel) async{
    items.add(itemModel);
    var box = await Hive. openBox("cart");
    box.put("cart_items", items.toList());
    Get.showSnackbar(
      GetBar(
        title: "Added",
        message: "to cart list",
        duration: Duration(seconds: 2),
      ),
    );
  }
  @override
  void dispose() {

    super.dispose();
  }



}
