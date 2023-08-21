import 'package:flutter/material.dart';

import '../../app.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2)).then(
      (_) => Navigator.of(context).pushReplacementNamed('/home'),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: BoxDecoration(color: context.color.primary),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Dog Breeds App',
                style: context.text.displaySmall.copyWith(color: Colors.white),
              ),
              const SizedBox(height: 24),
              CircularProgressIndicator(
                color: context.color.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
