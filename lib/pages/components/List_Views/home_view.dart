import 'package:flutter/material.dart';

Widget homelistWidget(messages, context) {
  return Expanded(
    child: SizedBox(
      height: MediaQuery.of(context).size.height * 0.8,
      child: ListView.builder(
        itemCount: messages.length,
        itemBuilder: (BuildContext context, int index) {
          return Text(
            messages[index],
            style: const TextStyle(fontSize: 20.0),
          );
        },
      ),
    ),
  );
}
