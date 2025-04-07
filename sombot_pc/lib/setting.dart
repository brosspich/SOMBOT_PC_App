import 'package:auto_route/auto_route.dart';
import 'package:core_ui/resources.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            boxRequired(enabled: true, label: 'Setting'),
            const Text('Setting'),
          ],
        ),
      ),
    );
  }
}
