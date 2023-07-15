import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsButton extends StatelessWidget {
  const SettingsButton({super.key, required this.func});
  final void Function() func;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Confirm logout'),
            content: const Text('Confirm logout'),
            actions: [
              TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Cancel')),
              TextButton(onPressed: func, child: const Text('Confirm'))
            ],
          );
        },
      ),
      child: Container(
        height: 100.w,
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fitHeight,
                image: AssetImage('assets/icons/Logout.png'))),
      ),
    );
  }
}
