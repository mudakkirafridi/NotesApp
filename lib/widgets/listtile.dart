import 'package:flutter/material.dart';

class myListTile extends StatelessWidget {
  final String message;
  const myListTile({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.today_outlined),
      title: Text(message),
      subtitle: Text('10.07pm'),
      trailing: Column(
        children: [
          InkWell(onTap: () {}, child: Icon(Icons.delete)),
          Icon(Icons.edit)
        ],
      ),
    );
  }
}
