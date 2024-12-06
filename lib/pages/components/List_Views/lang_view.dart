import 'package:flutter/material.dart';

Widget langlistWidget(languageList, context) {
  return SizedBox(
    height: MediaQuery.of(context).size.height * 0.8,
    child: ListView.builder(
      itemCount: languageList.length,
      itemBuilder: (BuildContext context, int index) {
        return Text(
          languageList[index],
          style: const TextStyle(fontSize: 20.0),
        );
      },
    ),
  );
}
