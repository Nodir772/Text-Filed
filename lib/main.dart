import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String input;
  var controller = TextEditingController();
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 350,
          child: TextField(
            obscureText: _obscureText,
            obscuringCharacter: "*",
            inputFormatters: [LengthLimitingTextInputFormatter(60)],
            controller: controller,
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            cursorWidth: 2,
            decoration: InputDecoration(
              counterText: "👨‍💻",
              suffixIcon: IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              ),
              prefixText: "🔎 ",
              label: Text("Paroli kirit---> [ ! ]"),
              hintText: "Search",
              helperText: "Brachka nima gap--->?",
              hintStyle: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black.withAlpha(128),
              ),
              border: OutlineInputBorder(),
              filled: true,
              fillColor: Colors.grey.shade200,
            ),
          ),
        ),
      ),
      floatingActionButton: IconButton(
        onPressed: () {
          controller.text = "Nodiri etgani!";
        },
        icon: Icon(Icons.add),
      ),
    );
  }
}
