import 'package:flutter/material.dart';
import 'package:ui_ux_app/data.dart';
import 'package:ui_ux_app/screens/home.dart';


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Home(document: Document());
  }
}

class BlockWidget extends StatelessWidget {
  final Block block;

  const BlockWidget({
    required this.block,
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      child: switch (block) {
        HeaderBlock(:final text) => Text(
          text,
          style: Theme.of(context).textTheme.displayMedium,
        ),
        ParagraphBlock(:final text) => Text(text),
        CheckboxBlock(:final text, :final isChecked) => Row(
          children: [
            Checkbox(
              value: isChecked,
              onChanged: (_) {},
            ),
            Text(text),
          ],
        ),
      },
    );
  }
}

String formatDate(DateTime dateTime) {
  final today = DateTime.now();
  final diff = dateTime.difference(today);

  return switch (diff) {
    Duration(inDays: 0) => 'today',
    Duration(inDays: 1) => 'tomorrow',
    Duration(inDays: -1) => 'yesterday',
    Duration(inDays: final days) when days > 7 => '${days ~/ 7} weeks from now',
    Duration(inDays: final days) when days < -7 => '${days.abs() ~/ 7} weeks ago',
    Duration(inDays: final days, isNegative: true) => '${days.abs()} days ago',
    Duration(inDays: final days) => '$days days from now',
  };
}