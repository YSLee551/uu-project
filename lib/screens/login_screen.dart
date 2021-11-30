import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:get/get.dart';
import 'package:uu_project/theme/colors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            Text(
              '한동대학교\n우산 공유 서비스',
              style: TextStyle(
                color: onSurface,
                fontFamily: 'main',
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 40,
            ),
            SizedBox(
              height: 500.h,
              width: 500.w,
              child: const Image(
                image: AssetImage('assets/logo.png'),
              ),
            ),
            const Spacer(),
            Text(
              '한동대학교 계정(@handong.edu)으로만\n로그인할 수 있습니다.',
              style: TextStyle(
                color: onSurface,
                fontFamily: 'main',
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 50.h,
            ),
            SignInButton(
              Buttons.Google,
              onPressed: () {Get.offNamed('/home');},
              
              text: "한동대학교 계정 구글 로그인",
            ),
            SizedBox(
              height: 150.h,
            ),
          ],
        ),
      ),
    );
  }
}
