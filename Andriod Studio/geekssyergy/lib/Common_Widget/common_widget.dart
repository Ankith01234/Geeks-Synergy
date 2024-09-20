import 'package:flutter/material.dart';

class CommonWidget
{

  myTextField(controller, text) {
    return Padding(
      padding: const EdgeInsets.only(right: 5, left: 5),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(hintText: text),
      ),
    );
  }

  myButton(operation, text, myColor, textColor) {
    return ElevatedButton(
        onPressed: operation,
        style: ElevatedButton.styleFrom(backgroundColor: myColor),
        child: Text(
          text,
          style: TextStyle(color: textColor),
        ));
  }

}
