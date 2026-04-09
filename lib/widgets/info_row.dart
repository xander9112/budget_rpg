import 'package:flutter/material.dart';

class UiInfoRow extends StatelessWidget {
  const UiInfoRow({super.key, required this.title, required this.value});

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '$title:',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              height: 1,
            ),
          ),
          SizedBox(width: 16),
          Text(
            value,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
              fontStyle: FontStyle.italic,
              height: 1,
            ),
          ),
        ],
      ),
    );
  }
}
