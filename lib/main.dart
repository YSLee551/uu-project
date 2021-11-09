import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/route_manager.dart';
import 'package:uu_project/screens/home_screen.dart';
import 'package:uu_project/screens/payment_method_screen.dart';
import 'package:uu_project/screens/payment_screen.dart';
import 'package:uu_project/screens/rent_qr_locker.dart';
import 'package:uu_project/screens/rent_qr_umb.dart';
import 'package:uu_project/screens/renting_screen.dart';
import 'package:uu_project/screens/return_qr_locker.dart';
import 'package:uu_project/screens/return_qr_umb.dart';
import 'package:uu_project/theme/colors.dart';

void main() {
  runApp(const UUApp());
}

class UUApp extends StatelessWidget {
  const UUApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'UU',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: primary,
        backgroundColor: surface,
      ),
      home: const HomeScreen(),
      getPages: [
        GetPage(
          name: '/home',
          page: () => const HomeScreen(),
        ),
        GetPage(
          name: '/paymentMethod',
          page: () => const PaymentMethodScreen(),
        ),
        GetPage(
          name: '/payment',
          page: () => const PaymentScreen(),
        ),
        GetPage(
          name: '/rent_qr_locker',
          page: () => const RentQRLockerScreen(),
        ),
        GetPage(
          name: '/rent_qr_umb',
          page: () => const RentQRUmbScreen(),
        ),
        GetPage(
          name: '/renting',
          page: () => RentingScreen(),
        ),
        GetPage(
          name: '/return_qr_locker',
          page: () => const ReturnQRLockerScreen(),
        ),
        GetPage(
          name: '/return_qr_umb',
          page: () => const ReturnQRUmbScreen(),
        ),
      ],
    );
  }
}
