import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final Map visitor;

  CustomCard({required this.visitor});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text('${visitor['firstname']} ${visitor['lastname']}'),
        subtitle: Text('Purpose: ${visitor['purpose']}\nWhom to Meet: ${visitor['whomToMeet']}'),
      ),
    );
  }
}
