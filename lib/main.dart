import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  TextEditingController digit1 = TextEditingController();
  TextEditingController digit2 = TextEditingController();
  String? digit1error;
  String? digit2error;
  int result = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            TextField(
              controller: digit1,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: const Text("Cifra 1"),
                errorText: digit1error
              ),
            ),
            Icon(Icons.add),
            TextField(
              controller: digit2,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: const Text("Cifra 2"),
                errorText: digit2error
              ),
            ),
            OutlinedButton(
                onPressed: () {
                  RegExp rg = RegExp("[0-9]+\$");

                  if(digit1.text.isEmpty) {
                    digit1error = "Devi inserire una cifra";
                  } else if(digit2.text.isEmpty) {
                    digit2error = "Devi inserire una cifra";
                  } else if (rg.allMatches(digit1.text).isEmpty) {
                    digit1error = "Devi inserire un numero e non una stringa di testo";
                  } else if (rg.allMatches(digit2.text).isEmpty) {
                    digit2error = "Devi inserire un numero e non una stringa di testo";
                  } else {
                    digit1error = null;
                    digit2error = null;

                    result = int.parse(digit1.text) + int.parse(digit2.text);
                  }
                  setState(() {});
                },
                child: Text("=")
            ),
            Text("Il risultato è"),
            Text(
              "$result",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold
              ),
            )
          ]
        ),
      ),
    );
  }
}
