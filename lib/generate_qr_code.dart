import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class GenerateQrCode extends StatefulWidget {
  const GenerateQrCode({super.key});

  @override
  State<GenerateQrCode> createState() => _GenerateQrCodeState();
}

class _GenerateQrCodeState extends State<GenerateQrCode> {
  TextEditingController urlController = TextEditingController();
  String qrData = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text("Generate QR Code",style: TextStyle(fontSize: 24,color: Colors.black,fontWeight: FontWeight.bold),)),
      ),
      body: Container(
        color: Colors.black12,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (qrData.isNotEmpty)
                  QrImageView(
                    data: qrData,
                    size: 200,
                  ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextField(
                    controller: urlController,
                    decoration: InputDecoration(
                      hintText: "Enter your data",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      labelText: "Enter Your Data",
                    ),
                  ),
                ),
                const SizedBox(height: 18),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      qrData = urlController.text;
                    });
                  },style: ElevatedButton.styleFrom(backgroundColor: Colors.greenAccent,foregroundColor: Colors.blue,),
                  child: const Text("Generate QR Code",style: TextStyle(fontSize: 19,color: Colors.black,fontWeight: FontWeight.bold),),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
