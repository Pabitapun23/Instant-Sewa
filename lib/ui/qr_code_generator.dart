import 'package:flutter/material.dart';
import 'package:instantsewa/util/hexcode.dart';
import 'package:qr_flutter/qr_flutter.dart';

class GenerateQrCode extends StatefulWidget {
  @override
  _GenerateQrCodeState createState() => _GenerateQrCodeState();
}

class _GenerateQrCodeState extends State<GenerateQrCode> {
  Color _purple = HexColor('#603f8b');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Qr Code'),
        centerTitle: true,
        backgroundColor: _purple,
      ),
      body: Center(
        child: Column(
          children: [
            QrImage(
              data: 'This is a simple QR code',
              version: QrVersions.auto,
              size: 320,
              gapless: false,
            )
          ],
        ),
      ),
    );
  }
}
