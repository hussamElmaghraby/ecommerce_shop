import 'package:flutter/cupertino.dart';
import '';
import 'app/app.dart';
import 'inits/injector.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const App());
}