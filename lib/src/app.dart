import 'package:flutter/material.dart';
import 'package:study_buddy/src/pages/my_home_page.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Stufy Buddy",
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: "Home"),
    );
  }
}
