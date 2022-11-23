import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import './screens/barcode_scanner_view.dart';
import './screens/language_identifier_view.dart';
import './screens/pose_detector_view.dart';
import './screens/object_detector_view.dart';

List<CameraDescription> cameras = [];

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ML App',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blueGrey,
      ),
      home: const MyHomePage(title: 'ML App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        backgroundColor: Colors.white70,
        body: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            children: [
              Flexible(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                        fit: FlexFit.tight,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BarcodeScannerView()),
                            );
                          },
                          child: Card(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                  height: 120,
                                  width: 150,
                                  child:
                                      Image.asset('assets/images/barcode.jpg')),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                'Barcode Scan',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 25),
                              )
                            ],
                          )),
                        )),
                    Flexible(
                        fit: FlexFit.tight,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PoseDetectorView()),
                            );
                          },
                          child: Card(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                  height: 120,
                                  width: 150,
                                  child: Image.asset(
                                      'assets/images/pose detection.png')),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                'Pose Detection',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 25),
                              )
                            ],
                          )),
                        ))
                  ],
                ),
              ),
              Flexible(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                        fit: FlexFit.tight,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      LanguageIdentifierView()),
                            );
                          },
                          child: Card(
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                SizedBox(
                                    height: 120,
                                    width: 150,
                                    child: Image.asset(
                                        'assets/images/language.jpg')),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  'Language Detection',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 25),
                                )
                              ])),
                        )),
                    Flexible(
                        fit: FlexFit.tight,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ObjectDetectorView()),
                            );
                          },
                          child: Card(
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                SizedBox(
                                    height: 120,
                                    width: 150,
                                    child: Image.asset(
                                        'assets/images/object detection.jpg')),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  'Object Detection',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 25),
                                )
                              ])),
                        ))
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
