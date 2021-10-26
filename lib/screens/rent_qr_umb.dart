import 'package:flutter/material.dart';
import 'package:uu_project/theme/button_widget.dart';
import 'package:uu_project/theme/title_appbar_widget.dart';

class RentQRUmbScreen extends StatelessWidget {
  const RentQRUmbScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: titleAppBar("우산 QR코드 인식"),
      body: Center(), //TODO: 여기에 QR 패키지 넣기
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: mainButton(
          buttonText: "넘어가기",
          elevation: 0,
          onPressed: () {
            Navigator.popUntil(
                context, ModalRoute.withName('/home')); //TODO: 대여 완료 화면으로 수정 필요
          }),
    );
  }
}
