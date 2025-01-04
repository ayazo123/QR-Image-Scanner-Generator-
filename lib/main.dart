import 'package:flutter/material.dart';
import 'package:qr_code_scanner_generator/Scann_qr_code.dart';
import 'package:qr_code_scanner_generator/generate_qr_code.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Qr code scanner and generator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: Text("Qr code and Scanner and Generator"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        color: Colors.black12,
        child: Center(
        
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ScanneQrCode()));
                    },);
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.greenAccent,foregroundColor: Colors.blue),
                  child: Text("Scan Qr code",style: TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.bold),),),
              SizedBox(height: 48),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => GenerateQrCode(),
                      ));
                    });
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.greenAccent,foregroundColor: Colors.blue,),
                  child: Text("Generate Qr code",style: TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.bold),))
            ],
          ),
        ),
      ),
    );
  }
}
