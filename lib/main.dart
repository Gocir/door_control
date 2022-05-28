import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late FToast fToast;
  late bool isButtonDisabled;

  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
    isButtonDisabled = false;
  }

  showToast() {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: isButtonDisabled ? Colors.green[50] : Colors.red[100],
      ),
      child: isButtonDisabled
          ? const Text("Selenoid has opened")
          : const Text("Selenoid closed"),
    );

    fToast.showToast(
      child: toast,
      gravity: ToastGravity.TOP,
      toastDuration: const Duration(seconds: 2),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFE6CC),
        title: Row(
          children: <Widget>[
            Icon(
              Icons.sensor_door,
              color: Colors.brown[800],
            ),
            const Text(
              "Door Control",
              style: TextStyle(
                color: Colors.black54,
              ),
            ),
          ],
        ),
        actions: [
          Container(
            margin: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black12,
            ),
            child: IconButton(
              onPressed: () {
                showToast();
                if (isButtonDisabled == false) {
                  setState(() {
                    isButtonDisabled = true;
                  });
                } else {
                  setState(() {
                    isButtonDisabled = false;
                  });
                }
              },
              icon: const Icon(
                Icons.power_settings_new,
                color: Color(0xFF4E342E),
              ),
            ),
          )
        ],
      ),
      body:
          // ListView.builder(
          // padding: const EdgeInsets.all(16),
          // itemCount: 1,
          // itemBuilder: (BuildContext context, int index) {
          //   return const Card(
          //     elevation: 1.5,
          //     shape: RoundedRectangleBorder(
          //       borderRadius: BorderRadius.all(Radius.circular(13)),
          //     ),
          //     child: ListTile(
          //       title: Text("(Name) has opened"),
          //       trailing: Text("(time)"),
          //     ),
          //   );
          // },
          // ListView.builder(
          // padding: const EdgeInsets.all(16),
          // itemCount: 1,
          // itemBuilder: (BuildContext context, int index) {
          //   return const Card(
          //     elevation: 1.5,
          //     shape: RoundedRectangleBorder(
          //       borderRadius: BorderRadius.all(Radius.circular(13)),
          //     ),
          //     child: ListTile(
          //       title: Text("Access Accepted/Denied"),
          //     ),
          //   );
          // },
          Container(
        margin: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 100,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/notification.png'),
                ),
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              "No Notifications",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Notifications will be available if you unlock or access the Auto-Lock System.",
                style: TextStyle(color: Colors.black26),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
