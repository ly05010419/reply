import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reply/ViewModel/LoginViewModel.dart';
import 'package:reply/views/MyApp.dart';

void main() => runApp(MultiProvider(
  providers: [
    ChangeNotifierProvider(
      create: (context) => LoginViewModel(),
    ),
  ],
  child: MyApp(),
));


