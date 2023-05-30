import 'package:flutter/material.dart';

import '../colors.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({Key? key, required this.label, this.controller,this.maxLines}) : super(key: key);
  final String label;
  final TextEditingController? controller;
  Function(String)? onChanged;
  int?maxLines;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged:onChanged ,
      validator: (value){
        if(value?.isEmpty??true){
          return "please fill the filed";
        }
      },
      controller: controller,
      maxLines: maxLines,
      cursorColor: teal,
      decoration: InputDecoration(labelStyle:const TextStyle(color: teal),
          label:Text(label) ,
          border: buildOutlineInputBorder(),
          enabledBorder: buildOutlineInputBorder(),
          focusedBorder: buildOutlineInputBorder()),
    );
  }
  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
        borderSide: const BorderSide(color: white),
        borderRadius: BorderRadius.circular(10));
  }

}
