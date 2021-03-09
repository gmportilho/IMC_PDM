import 'package:flutter/material.dart';
import 'package:imc_app/screen/imc.page.dart';
import 'dart:io';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: ImcScreen(),
    ); 
  }
}






