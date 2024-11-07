import 'package:flutter/material.dart';

class OptionsTile extends StatelessWidget {
  const OptionsTile({
    super.key,
    required this.ctx,
    required this.title,
    required this.icon,
  });
  final BuildContext ctx;
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
      ),
      title: Text(title),
      onTap: () {
        Navigator.pop(context);
        // Implement the specific action
      },
    );
  }
}
