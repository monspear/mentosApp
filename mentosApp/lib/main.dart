import 'package:flutter/material.dart';
import 'package:mentos/page/login_page.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting();
  await Firebase.initializeApp();

  runApp(
    MaterialApp(
        home: login_page()
    ),
  );
}