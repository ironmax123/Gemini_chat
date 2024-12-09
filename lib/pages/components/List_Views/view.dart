import 'package:flutter/material.dart';

Widget listWidget(target, context, {required bool useExpanded}) {
  final listView = SizedBox(
    height: MediaQuery.of(context).size.height * 0.8,
    child: ListView.builder(
      itemCount: target.length,
      itemBuilder: (BuildContext context, int index) {
        return Text(
          target[index],
          style: const TextStyle(fontSize: 20.0),
        );
      },
    ),
  );

  if (useExpanded) {
    return Expanded(child: listView);
  }
  return listView;
}
