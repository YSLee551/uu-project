import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uu_project/controllers/database.dart';
import 'package:uu_project/controllers/rent_return_controller.dart';
import 'package:uu_project/theme/button_widget.dart';
import 'package:uu_project/theme/colors.dart';
import 'package:uu_project/theme/title_appbar_widget.dart';

class RentingScreen extends StatelessWidget {
  final String lockerID = RentReturnController.getLocker();
  final String umbID = RentReturnController.getUmb();

  @override
  Widget build(BuildContext context) {
    DataBase.getUmbInfo(umbId: umbID);
    return Scaffold(
      appBar: titleAppBar("대여중"),
      body: Center(
        child: SizedBox(
          height: 300,
          width: 200,
          child: Column(
            children: [
              Text(
                '우산  비밀번호',
                style: TextStyle(
                  color: onSurface,
                  fontFamily: 'main',
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                DataBase.umbrella.password,
                style: TextStyle(
                  color: onSurface,
                  fontFamily: 'main',
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 50,
              ),
              Text(
                '누적  사용시간',
                style: TextStyle(
                  color: onSurface,
                  fontFamily: 'main',
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                '1 시간',
                style: TextStyle(
                  color: onSurface,
                  fontFamily: 'main',
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              )
            ],
          ),
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
