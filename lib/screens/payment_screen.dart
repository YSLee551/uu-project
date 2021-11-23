import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uu_project/theme/button_widget.dart';
import 'package:uu_project/theme/colors.dart';
import 'package:uu_project/theme/title_appbar_widget.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  late bool _hourButtonState;
  late bool _dayButtonState;

  @override
  void initState() {
    super.initState();
    _hourButtonState = false;
    _dayButtonState = false;
  }

  void _hourButtonSelect() {
    setState(() {
      _hourButtonState = !_hourButtonState;
      if (_hourButtonState && _dayButtonState) {
        _dayButtonState = false;
      }
    });
  }

  void _dayButtonSelect() {
    setState(() {
      _dayButtonState = !_dayButtonState;
      if (_dayButtonState && _hourButtonState) {
        _hourButtonState = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: titleAppBar("이용권 구매"),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            Text(
              "[기본요금]",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontFamily: 'Main',
                color: onSurface,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "1시간 - 300원\n24시간(하루) - 1000원",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'Main',
                color: onSurface,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "기본으로 사용할 시간을 선택하시고\n구매하기 버튼을 누르시면\n등록하신 결제수단으로\n기본요금이 자동결제됩니다.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                fontFamily: 'Main',
                color: onSurface,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Text(
              "[추가요금]",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontFamily: 'Main',
                color: onSurface,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "1시간 - 100원",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'Main',
                color: onSurface,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "반납이 완료되면 1시간 단위로\n추가요금이 자동 결제됩니다.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                fontFamily: 'Main',
                color: onSurface,
              ),
            ),
            const SizedBox(
              height: 150,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _hourButtonSelect();
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 110,
                    height: 100,
                    child: Text(
                      "1시간",
                      style: TextStyle(
                          color: onSurface,
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'main'),
                    ),
                  ),
                  style: ButtonStyle(
                      overlayColor: _hourButtonState
                          ? MaterialStateProperty.all(surface)
                          : MaterialStateProperty.all(accent),
                      backgroundColor: _hourButtonState
                          ? MaterialStateProperty.all(accent)
                          : MaterialStateProperty.all(surface)),
                ),
                const SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _dayButtonSelect();
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 110,
                    height: 100,
                    child: Text(
                      "24시간",
                      style: TextStyle(
                          color: onSurface,
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'main'),
                    ),
                  ),
                  style: ButtonStyle(
                      overlayColor: _dayButtonState
                          ? MaterialStateProperty.all(surface)
                          : MaterialStateProperty.all(accent),
                      backgroundColor: _dayButtonState
                          ? MaterialStateProperty.all(accent)
                          : MaterialStateProperty.all(surface)),
                ),
              ],
            )
          ],
        ),
      ), //TODO: 여기에 이용권 구매 페이지 넣기
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: mainButton(
          buttonText: "구매하기",
          elevation: 0,
          onPressed: () {
            if (_hourButtonState || _dayButtonState) {
              Get.offNamed('/rent_qr_locker');
            }
          }),
    );
  }
}
