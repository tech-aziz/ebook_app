// ignore_for_file: use_build_context_synchronously

import 'package:ebook_app/features/app_colors.dart';
import 'package:ebook_app/features/auth/login_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
      Duration(seconds: 2),
      () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.bgColor,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.bgColor,
          body: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/img/logo.png',
                  height: 60,
                  width: 60,
                  fit: BoxFit.cover,
                ),
                SizedBox(width: 12),
                Text(
                  'PublicationHub',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                    color: AppColors.textColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
