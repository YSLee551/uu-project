// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:get/get.dart';
// import 'package:get/state_manager.dart';

// import 'database.dart';

// class AuthController extends GetxController {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final Rxn<User> _firebaseUser = Rxn<User>();

//   @override
//   void onInit() {
//     _firebaseUser.bindStream(_auth.authStateChanges());
//     super.onInit();
//   }

//   void createUser(String email, String password) async {
//     try {
//       UserCredential result = await _auth.createUserWithEmailAndPassword(
//           email: email, password: password);
//       User? user = result.user;

//       await DatabaseService(uid: user!.uid)
//           .updateUserData('$email', '$password');
//       //Get.back();
//     } on FirebaseAuthException catch (e) {
//       Get.snackbar("Error creating account", e.message.toString(),
//           snackPosition: SnackPosition.BOTTOM);
//     }
//   }

//   void login(String email, String password) async {
//     try {
//       UserCredential result = await _auth.createUserWithEmailAndPassword(
//           email: email, password: password);
//       User? user = result.user;

//       await DatabaseService(uid: user!.uid)
//           .updateUserData('$email', '$password');
//     } on FirebaseAuthException catch (e) {
//       Get.snackbar("Error logging in", e.message.toString(),
//           snackPosition: SnackPosition.BOTTOM);
//     }
//   }

//   void signOut() async {
//     try {
//       await _auth.signOut();
//     } on FirebaseAuthException catch (e) {
//       Get.snackbar("Error sign out", e.message.toString(),
//           snackPosition: SnackPosition.BOTTOM);
//     }
//   }
// }
