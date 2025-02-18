import 'package:flutter/material.dart';

void main() {
  runApp(
      MyApp()
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CurrencyApp(),
    );
  }
}

class CurrencyApp extends StatefulWidget {
  const CurrencyApp({super.key});

  @override
  State<CurrencyApp> createState() => _CurrencyAppState();
}

class _CurrencyAppState extends State<CurrencyApp> {
  TextEditingController amountCurr=TextEditingController();
  double exchangeRate=0.0006632;
  double result=0.0;

  void converterBrain(){
    setState(() {
      result=double.parse(amountCurr.text)*exchangeRate;

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //  crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Text('AbokiFx',style: TextStyle(
                fontFamily: 'Dancing_Script',
                fontSize: 30
            ),),
            TextField(
              controller:amountCurr ,

              decoration: InputDecoration(
                  label: Text('Amount'),
                  hintText: 'Enter the Naria Amount',
                  border: OutlineInputBorder()

              ),

            ),
            Text(result==0.0?'':'Converted Rate \$${result.toStringAsFixed(2)}',
              style: TextStyle(
                  color: Colors.white
              ),
            ),
            ElevatedButton(
                onPressed: converterBrain,
                child: Text('Convert Now',style: TextStyle(color: Colors.black54),))
          ],
        ),
      ),
    );
  }
}



