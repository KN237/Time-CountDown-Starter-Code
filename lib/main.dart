import 'dart:async';
import 'package:flutter/material.dart';

const title = 'Countdown Demo';
const dayCount = 3;
Timer? timer;
DateTime today = DateTime.now();
DateTime finalDay = DateTime(2024, 9, 14, 14, 00);

void main() {
  runApp(
    MaterialApp(
      title: title,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: const HomePage(),
    ),
  );
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Duration difference = finalDay.difference(today);
  @override
  void initState() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (Timer t) {
        if (difference > Duration.zero) {
          setState(() {
            difference = difference - const Duration(seconds: 1);
          });
        }
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(title),
      ),
      body: Center(
        child: Text(
          'J: ${difference.inDays.toString().padLeft(2, '0')}  H :${difference.inHours.remainder(24).toString().padLeft(2, '0')} M :${difference.inMinutes.remainder(60).toString().padLeft(2, '0')}  S :${difference.inSeconds.remainder(60).toString().padLeft(2, '0')}',
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
