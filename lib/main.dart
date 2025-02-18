

import 'package:flutter/material.dart';

void main(){
  runApp(
    MyApp()
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData(
        fontFamily: 'Poppins'
      ),
      home: HomePage()
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double currencyRate=0.85;
  TextEditingController currAmount=TextEditingController();
  String result='';
  void convertBrain(double intAmount,double rate ){
    double convertedAmount=intAmount*rate;
    setState(() {
      result=convertedAmount.toString();
    });
  }
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('AbokiFx',style: TextStyle(
                  fontFamily: 'Dancing_Script',
                  fontSize: 70
                ),),
                TextField(
                  controller: currAmount,
                  decoration: InputDecoration(

                    label: Text(
                        'Amount'
                    ),
                    prefixIcon: Icon(Icons.monetization_on),
                    border: OutlineInputBorder(
                    ),
                    hintText: 'Enter the Amount in Naria'
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  result.isEmpty?'The converted value show here':'converted :N$result',
                  style: TextStyle(
                    fontFamily: 'Poppins'
                  ),
                ),
                ElevatedButton(onPressed: (){
                  convertBrain(double.parse(currAmount.text),currencyRate);
                }, child: Text(
                  'Convert Now'
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

