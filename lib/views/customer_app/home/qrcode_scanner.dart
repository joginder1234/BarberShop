import 'dart:io';

import 'package:barbershop/services/stylesheet/colors.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class CustomerAppQRCodeScanner extends StatefulWidget {
  const CustomerAppQRCodeScanner({Key? key}) : super(key: key);

  @override
  State<CustomerAppQRCodeScanner> createState() =>
      _CustomerAppQRCodeScannerState();
}

class _CustomerAppQRCodeScannerState extends State<CustomerAppQRCodeScanner> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.resumeCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      debugPrint("QR Code Data :: ${scanData.code}");
      setState(() {
        result = scanData;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: QRView(
              overlay: QrScannerOverlayShape(
                  borderRadius: 15, borderColor: AppColors.activeButtonColor),
              key: qrKey,
              onQRViewCreated: (v) => _onQRViewCreated(v))),
    );
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
