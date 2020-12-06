import 'package:flutter/material.dart';
import 'package:instantsewa/util/hexcode.dart';
import 'package:qr_flutter/qr_flutter.dart';

class GenerateQrCode extends StatefulWidget {
  final String operationId;

  const GenerateQrCode({Key key, this.operationId}) : super(key: key);
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
              data: widget.operationId,
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
