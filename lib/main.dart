import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

void main() {
  runApp(const ConnectivityApp());
}

class ConnectivityApp extends StatefulWidget {
  const ConnectivityApp({Key? key}) : super(key: key);

  @override
  State<ConnectivityApp> createState() => _ConnectivityAppState();
}

class _ConnectivityAppState extends State<ConnectivityApp> {
  @override
  void initState() {
    super.initState();

    checkConnectivity();
  }

  void checkConnectivity() async {
    var result = await Connectivity().checkConnectivity();

    print(result.name);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: StreamBuilder<ConnectivityResult>(
            stream: Connectivity().onConnectivityChanged,
            builder: (context, snapshot) {
              return Scaffold(
                body: snapshot.data == ConnectivityResult.none
                    ? Center(child: Text("No Internet Connection"))
                    : Center(child: Text("Intertet connected")),
              );
            }));
  }
}
