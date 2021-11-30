import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:uu_project/controllers/rent_return_controller.dart';
import 'package:uu_project/theme/button_widget.dart';
import 'package:uu_project/theme/colors.dart';
import 'package:uu_project/theme/title_appbar_widget.dart';
import 'package:image_picker/image_picker.dart';
//import 'package:firebase_storage/firebase_storage.dart';

class ReturnQRUmbScreen extends StatefulWidget {
  const ReturnQRUmbScreen({Key? key}) : super(key: key);

  @override
  State<ReturnQRUmbScreen> createState() => _ReturnQRUmbScreenState();
}

class _ReturnQRUmbScreenState extends State<ReturnQRUmbScreen> {
  final qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  Barcode? _barcode;
  Set<String> umbIDs = {'1', '2', '3', '4'};

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: qrTitleAppBar("우산 QR코드 인식"),
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
          onPressed: () async {
            if (_barcode != null && umbIDs.contains(_barcode!.code)) {
              RentReturnController.setUmb(_barcode!.code!);
              RentReturnController.returnUmb();
              final ImagePicker _picker = ImagePicker();
              final XFile? photo =
                  await _picker.pickImage(source: ImageSource.camera);
              //TODO: rent data DB로 올려주고 정보 받아오기
              Get.offAllNamed('/home');
            }
          }),
    );
  }

  Widget buildResult() {
    return Text(
      _barcode != null
          ? umbIDs.contains(_barcode!.code)
              ? "우산 ${_barcode!.code}\n인식되었습니다."
              : "우산에 부착된 QR코드를\n인식시켜주세요."
          : "우산에 부착된 QR코드를\n인식시켜주세요.",
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
    //TODO: rent controller로 올려주기
    //if (_barcode != null && lockerIDs.contains(_barcode!.code)) Navigator.pushReplacementNamed(context, '/rent_qr_umb', arguments: _barcode?.code);
  }

  // void uploadImageToStorage(ImageSource source) async {
  //   File image = await ImagePicker.pickImage(source: source);

  //   if (image == null) return;
  //   setState(() {
  //     _image = image;
  //   });

  //   // 프로필 사진을 업로드할 경로와 파일명을 정의. 사용자의 uid를 이용하여 파일명의 중복 가능성 제거
  //   StorageReference storageReference =
  //       _firebaseStorage.ref().child("profile/${_user.uid}");

  //   // 파일 업로드
  //   StorageUploadTask storageUploadTask = storageReference.putFile(_image);

  //   // 파일 업로드 완료까지 대기
  //   await storageUploadTask.onComplete;

  //   // 업로드한 사진의 URL 획득
  //   String downloadURL = await storageReference.getDownloadURL();

  //   // 업로드된 사진의 URL을 페이지에 반영
  //   setState(() {
  //     _profileImageURL = downloadURL;
  //   });
  // }
}
