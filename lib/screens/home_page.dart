import 'package:flutter/material.dart';
import 'package:flutter_bitcoin_assignment_prashant/constants/AppStings.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  closePage() {
    Navigator.of(context).pop();
  }

  Widget pageContent() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          backgroundColor: const Color(0xFFFFFFFF),
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            actions: [
              
            ],
          ),
          body: pageContent(),
        ),
        onWillPop: () => closePage(),
    );
  }
}
