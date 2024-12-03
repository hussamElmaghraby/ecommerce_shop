import 'package:flutter/cupertino.dart';
import '';
import 'app/app.dart';
import 'inits/injector.dart';

void main(){
  configureDependencies();
  runApp(const App());
}