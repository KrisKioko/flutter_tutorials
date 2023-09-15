import 'package:flutter/material.dart';
import 'package:ui_ux_app/app.dart';
import 'package:ui_ux_app/data.dart';


class Home extends StatelessWidget {
  final Document document;

  const Home({
    required this.document,
    super.key,
  });

  @override
  Widget build (BuildContext context) {
    final (title, :modified) = document.metadata;
    final formattedModifiedDate = formatDate(modified);
    final blocks = document.getBlocks();

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(title),
        ),
      ),
      body: Column(
        children: [
          Center(
            child: Text('Last modified: $formattedModifiedDate'),
          ),
          
          Expanded(
            child: ListView.builder(
              itemCount: blocks.length,
              itemBuilder: (context, index) {
                return BlockWidget(block: blocks[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}