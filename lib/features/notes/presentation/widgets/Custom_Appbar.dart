import 'package:flutter/material.dart';
import 'package:my_agenda/core/utils/colors.dart';

class CustomAppBar extends StatelessWidget {
  final IconData icon;
  final String title;
  const CustomAppBar({Key? key, required this.icon, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
         title,
          style:const  TextStyle(fontSize: 22, ),
        ),
       const Spacer(),
        IconButton(onPressed: () {}, icon: Icon(icon))
      ],
    );
  }
}
