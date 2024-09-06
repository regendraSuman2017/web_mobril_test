import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:web_mobril_test/routes/app_pages.dart';
import 'package:web_mobril_test/service/firebase_auth_services.dart';


class SignUpScreenController extends GetxController{


  GlobalKey<FormState> formKey = GlobalKey<FormState>();


  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();


  final GoogleSignIn googleSignIn = GoogleSignIn();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  RxBool isSigningUp = false.obs;


  void registerUser() async {

    showDialog(
        context: Get.context!,
        builder: (BuildContext _) => Center(
          child: LoadingAnimationWidget.threeArchedCircle(
            color: const Color.fromARGB(255, 255, 177, 41),
            size: Get.width*0.12,
          ),
        )
    );


    try {
      isSigningUp.value = true;

      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim())
        .then((value) => {postDetailsToFirestore()})
        .catchError((e) {
    Fluttertoast.showToast(msg: e!.message);
    });



    } catch (e) {
      Navigator.of(Get.context!).pop();
      Get.snackbar(
        "Failed",
        "This E-mail Id Already Exist",
        icon: const Icon(Icons.clear, color: Colors.white),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        borderRadius: 20,
        margin: const EdgeInsets.all(15),
        colorText: Colors.white,
        duration: const Duration(seconds: 3),
        isDismissible: true,
        forwardAnimationCurve: Curves.easeOutBack,
      );
     // Fluttertoast.showToast(msg: "Some error happened");
    }
  }

  postDetailsToFirestore() async {

    DocumentReference docRef = await FirebaseFirestore.instance.collection('RegisterUsers')
        .add({
      'name': nameController.text,
      'emailId': emailController.text,
      'password': passwordController.text,
    });
   print("aldsalk ${docRef}");
    Get.back();

    if(docRef!=null){
     Fluttertoast.showToast(msg: "Account Created Successfully :)");
    Future.delayed(const Duration(seconds: 1));
    Get.offAllNamed(Routes.loginScreen);
   }

    nameController.clear();
    emailController.clear();
    passwordController.clear();

  }


  Future<UserCredential?> signUpWithGoogle() async {
    showDialog(
        context: Get.context!,
        builder: (BuildContext _) => Center(
          child: LoadingAnimationWidget.threeArchedCircle(
            color: const Color.fromARGB(255, 255, 177, 41),
            size: Get.width*0.12,
          ),
        )
    );

    final FirebaseAuth _auth = FirebaseAuth.instance;
    try {
      final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();

      if (googleSignInAccount != null) {

        final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        final UserCredential userCredential = await _auth.signInWithCredential(credential);
        print("laskjdlka ${userCredential}");
        print("laskjdlka ${userCredential.additionalUserInfo!.isNewUser}");
        Navigator.of(Get.context!).pop();
        if(userCredential.additionalUserInfo!.isNewUser==true){
           Get.snackbar(
            "Success",
            "Signup Successful!",
            icon: const Icon(Icons.clear, color: Colors.white),
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            borderRadius: 20,
            margin: const EdgeInsets.all(15),
            colorText: Colors.white,
            duration: const Duration(seconds: 3),
            isDismissible: true,
            forwardAnimationCurve: Curves.easeOutBack,

          );
           Get.offAllNamed(Routes.loginScreen);
        }else{
          Get.snackbar(
            "Failed",
            "This E-mail Id Already Exist",
            icon: const Icon(Icons.clear, color: Colors.white),
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            borderRadius: 20,
            margin: const EdgeInsets.all(15),
            colorText: Colors.white,
            duration: const Duration(seconds: 3),
            isDismissible: true,
            forwardAnimationCurve: Curves.easeOutBack,
          );
        }
        await googleSignIn.disconnect();

      }
    } catch (error) {
      if (kDebugMode) {
        print(error);
      }
    }
  }

}