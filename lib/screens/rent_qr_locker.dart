import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:uu_project/controllers/rent_return_controller.dart';
import 'package:uu_project/theme/button_widget.dart';
import 'package:uu_project/theme/colors.dart';
import 'package:uu_project/theme/title_appbar_widget.dart';

class RentQRLockerScreen extends StatefulWidget {
  const RentQRLockerScreen({Key? key}) : super(key: key);

  @override
  State<RentQRLockerScreen> createState() => _RentQRLockerScreenState();
}

class _RentQRLockerScreenState extends State<RentQRLockerScreen> {
  final qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  Barcode? _barcode;
  Set<String> lockerIDs = {'1001', '1002', '1003', '1004'};

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: qrTitleAppBar("보관함 QR코드 인식"),
      body: Stack(
        alignment: Alignment.center,
        children: [
          buildQrView(context),
          Positioned(top: 80, child: buildResult()),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: mainButton(
          buttonText: "다음",
          elevation: 0,
          onPressed: () {
            if (_barcode != null && lockerIDs.contains(_barcode!.code)) {
              RentReturnController.setLocker(_barcode!.code!);
              Get.offNamed('/rent_qr_umb');
            }
          }),
    );
  }

  Widget buildResult() {
    return Text(
      _barcode != null
          ? lockerIDs.contains(_barcode!.code)
              ? "보관함 ${_barcode!.code![3]}\n인식되었습니다."
              : "우산 보관함에 부착된 QR코드를\n인식시켜주세요."
          : "우산 보관함에 부착된 QR코드를\n인식시켜주세요.",
      style: TextStyle(
        color: surface,
        fontFamily: 'main',
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget buildQrView(BuildContext context) {
    return QRView(
      key: qrKey,
      onQRViewCreated: onQRViewCreated,
      overlay: QrScannerOverlayShape(
        borderColor: accent,
        borderLength: 30,
        borderWidth: 20,
        borderRadius: 5,
        cutOutBottomOffset: 40,
        cutOutSize: MediaQuery.of(context).size.width * 0.7,
      ),
    );
  }

  void onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });

    controller.scannedDataStream.listen((_barcode) {
      setState(() {
        this._barcode = _barcode;
      });
    });
    //Navigator.pushReplacementNamed(context, '/rent_qr_umb', arguments: _barcode?.code);
  }
}
