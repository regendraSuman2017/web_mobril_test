import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_mobril_test/CustomAppbar.dart';
import 'package:web_mobril_test/core/localdatabase/product_cart_list.dart';
import 'package:web_mobril_test/module/product_detail_page/product_detail_controller.dart';
import 'package:web_mobril_test/responsive.dart';

class ProductDetailPage extends GetView<ProductDetailController> {
  const ProductDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileBody: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Product Detail'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Obx(() => controller.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            controller.imageUrl.isEmpty
                ? const Text("Image loading")
                : Image.network(
              controller.imageUrl.value,
              width: _imageSize(context),
              height: _imageSize(context),
              fit: BoxFit.fill,
            ),
            const SizedBox(height: 10),
            _buildProductDetails(context),
            const SizedBox(height: 20),
            _buildActionButtons(context),
          ],
        )),
      ),
    );
  }

  double _imageSize(BuildContext context) {
    return ResponsiveLayout.isSmallScreen(context)
        ? Get.width * 0.55
        : Get.width * 0.3;
  }

  Widget _buildProductDetails(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          controller.title.toString(),
          style: TextStyle(
            fontSize: ResponsiveLayout.isSmallScreen(context)
                ? Get.width * 0.06
                : Get.width * 0.022,
            fontWeight: FontWeight.bold,
          ),
          maxLines: 2,
        ),
        const SizedBox(height: 10),
        Text(
          '\u{20B9} ${controller.price}',
          style: TextStyle(
            fontSize: ResponsiveLayout.isSmallScreen(context)
                ? Get.width * 0.055
                : Get.width * 0.015,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          'Description',
          style: TextStyle(
            fontSize: ResponsiveLayout.isSmallScreen(context)
                ? Get.width * 0.055
                : Get.width * 0.016,
            color: Colors.black45,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          controller.description.toString(),
          style: TextStyle(
            fontSize: ResponsiveLayout.isSmallScreen(context)
                ? Get.width * 0.04
                : Get.width * 0.014,
          ),
          textAlign: TextAlign.justify,
        ),
      ],
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildButton(
          context,
          'Add to Cart',
          Icons.shopping_cart,
          Colors.blue,
              () async {
            ProductCartListOffline product = ProductCartListOffline(
              productId: controller.product.id,
              category: controller.product.category,
              title: controller.product.title,
              description: controller.product.description,
              image: controller.product.image,
              price: controller.product.price,
              quantity: 1,
            );
            await product.save();
            print('Item added to cart');
          },
        ),
        _buildButton(
          context,
          'Add to wish',
          null,
          Colors.orangeAccent,
              () {},
        ),
      ],
    );
  }

  Widget _buildButton(BuildContext context, String text, IconData? icon,
      Color color, VoidCallback onPressed) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: icon != null ? Icon(icon) : const SizedBox.shrink(),
      label: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: ResponsiveLayout.isSmallScreen(context)
              ? Get.width * 0.045
              : Get.width * 0.021,
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: EdgeInsets.symmetric(
          horizontal: 24,
          vertical: ResponsiveLayout.isSmallScreen(context)
              ? Get.width * 0.045
              : Get.width * 0.015,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
