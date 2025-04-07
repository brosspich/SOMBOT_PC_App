import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sombot_pc/router/app_route.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: 
      Scaffold(
        appBar: AppBar(
          title: const Text('Home Page'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Welcome to the Home Page!'),
              ElevatedButton(
                onPressed: () {
                 context.pushRoute(SettingRoute());
                },
                child: const Text('Go to Another Page'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}