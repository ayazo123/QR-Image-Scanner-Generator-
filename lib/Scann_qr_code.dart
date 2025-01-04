import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';


class ScanneQrCode extends StatefulWidget {
  const ScanneQrCode({super.key});

  @override
  State<ScanneQrCode> createState() => _ScanneQrCodeState();
}

class _ScanneQrCodeState extends State<ScanneQrCode> {
  String qrResult = "Result will display Here";

  Future<void> scanQR() async {
    try {
      final QrCode = await FlutterBarcodeScanner.scanBarcode(
          "#ff6666", "Cancel", true, ScanMode.QR);
      if (!mounted) return;
      setState(() {
        this.qrResult = QrCode.toString();
      });
    } on PlatformException {
      qrResult = "Fail to read qr code";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Qr code scanner",style: TextStyle(fontSize: 24,color: Colors.black,fontWeight: FontWeight.bold),),),
      ),
      body: Container(
        color: Colors.black12,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 38,
            ),
            Text(
              "$qrResult",
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(
              height: 38,
            ),
            Center(
              child: ElevatedButton(onPressed: scanQR,style: ElevatedButton.styleFrom(backgroundColor: Colors.greenAccent,foregroundColor: Colors.blue), child: Text("Scan code",style: TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.bold),),)),
          ],
        ),
      ),
    );
  }
}
