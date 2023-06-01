import 'package:flutter/material.dart';
import 'package:my_agenda/core/utils/colors.dart';

class CustomAppBar extends StatelessWidget {
  final IconData icon;
  final String title;
  void Function()? onPressed;
 CustomAppBar({Key? key, required this.icon, required this.title,this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
         title,
          style:const  TextStyle(fontSize: 22, ),
        ),
       const Spacer(),
        IconButton(onPressed:onPressed , icon: Icon(icon))
      ],
    );
  }
}
