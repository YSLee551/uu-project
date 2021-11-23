import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uu_project/theme/button_widget.dart';
import 'package:uu_project/theme/title_appbar_widget.dart';

class PaymentMethodScreen extends StatelessWidget {
  const PaymentMethodScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: titleAppBar("결제수단 등록"),
      body: Center(), //TODO: 여기에 결제수단 등록 페이지 넣기
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: mainButton(
          buttonText: "등록하기",
          elevation: 0,
          onPressed: () {
            Get.back();
          }),
    );
  }
}
