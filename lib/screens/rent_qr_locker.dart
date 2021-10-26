import 'package:flutter/material.dart';
import 'package:uu_project/theme/button_widget.dart';
import 'package:uu_project/theme/title_appbar_widget.dart';

class RentQRLockerScreen extends StatelessWidget {
  const RentQRLockerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: titleAppBar("보관함 QR코드 인식"),
      body: Center(), //TODO: 여기에 QR 패키지 넣기
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: mainButton(
          buttonText: "넘어가기",
          elevation: 0,
          onPressed: () {
            Navigator.pushNamed(context, '/rent_qr_locker');
          }),
    );
  }
}
