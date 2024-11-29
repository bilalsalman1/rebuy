import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rebuyy/view/home_view.dart';
import 'package:rebuyy/view/register_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterController extends GetxController {
  final firebase = FirebaseAuth.instance;

  bool isLogin = true;
  var loginEmail = ''.obs;
  var loginPassword = ''.obs;
  var signupEmail = ''.obs;
  var signupPassword = ''.obs;
  var username = ''.obs;
  String? usernames;
  @override
  void onInit() {
    super.onInit();
    _checkLoginStatus();
  }

  var selectedButton = 0.obs;

  void updateButton(int value) {
    selectedButton.value = value;
    update();
  }

  Future<void> _checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    bool? isLoggedIn = prefs.getBool('isLoggedIn');
    if (isLoggedIn != null && isLoggedIn) {
      Get.off(() => HomeView());
    }
  }

  void submit() async {
    try {
      if (isLogin) {
        final userCredential = await firebase.signInWithEmailAndPassword(
          email: loginEmail.string,
          password: loginPassword.string,
        );
        print('User logged in successfully: ${userCredential.user}');

        final prefs = await SharedPreferences.getInstance();
        await prefs.setBool('isLoggedIn', true);
        Get.off(() => HomeView());
      } else {
        final userCredential = await firebase.createUserWithEmailAndPassword(
          email: signupEmail.string,
          password: signupPassword.string,
        );
        print('User registered successfully: ${userCredential.user}');

        final prefs = await SharedPreferences.getInstance();
        await prefs.setBool('isLoggedIn', false);

        Get.off(() => HomeView());
      }
    } on FirebaseAuthException catch (error) {
      print('FirebaseAuthException: ${error.code}, Message: ${error.message}');
    }
  }

  void loginWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await firebase.signInWithCredential(credential);
      usernames = googleUser.displayName;
      Get.off(() => HomeView);
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => RegisterView());
    } catch (e) {
      Get.snackbar(
        'Logout Failed',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
