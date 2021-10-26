import 'package:flutter/material.dart';
import 'package:uu_project/screens/home_screen.dart';
import 'package:uu_project/screens/payment_method_screen.dart';
import 'package:uu_project/screens/payment_screen.dart';
import 'package:uu_project/screens/rent_qr_locker.dart';
import 'package:uu_project/screens/rent_qr_umb.dart';
import 'package:uu_project/theme/colors.dart';

void main() {
  runApp(const UUApp());
}

class UUApp extends StatelessWidget {
  const UUApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'UU',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: primary,
          backgroundColor: surface,
        ),
        home: const HomeScreen(),
        routes: {
          '/home': (context) => const HomeScreen(),
          '/paymentMethod': (context) => const PaymentMethodScreen(),
          '/payment': (context) => const PaymentScreen(),
          '/rent_qr_locker':(constext) => const RentQRLockerScreen(),
          '/rent_qr_umb':(constext) => const RentQRUmbScreen(),
        });
  }
}
