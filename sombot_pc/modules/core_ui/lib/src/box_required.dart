import 'package:flutter/material.dart';


Widget boxRequired({
  required bool enabled,
  required String label,
}) {
  return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: enabled ? Colors.black : Colors.grey,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: enabled ? Colors.amber : Colors.grey,
        ),
      ));
}
