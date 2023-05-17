import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:live_share/firebase_options.dart';
import 'package:live_share/live_share_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const LiveShareApp());
}
