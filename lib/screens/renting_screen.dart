import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uu_project/controllers/rent_controller.dart';
import 'package:uu_project/theme/button_widget.dart';
import 'package:uu_project/theme/title_appbar_widget.dart';

class RentingScreen extends StatelessWidget {
  final RentController _con = RentController();
  final String lockerID = RentController.getLocker();
  final String umbID = RentController.getUmb();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: titleAppBar("대여중"),
      body: Center(
        child: Column(
          children: [Text(lockerID), Text(umbID)],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: mainButton(
          buttonText: "반납하기",
          elevation: 0,
          onPressed: () {
            Get.toNamed('/return_qr_locker');
          }),
    );
  }
}
