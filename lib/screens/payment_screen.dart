import 'package:flutter/material.dart';
import 'package:uu_project/theme/button_widget.dart';
import 'package:uu_project/theme/title_appbar_widget.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: titleAppBar("이용권 구매"),
      body: Center(), //TODO: 여기에 이용권 구매 페이지 넣기
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: mainButton(
          buttonText: "구매하기",
          elevation: 0,
          onPressed: () {
            Navigator.pushReplacementNamed(
                context, '/rent_qr_locker'); //TODO: 웨않뒘...
          }),
    );
  }
}
