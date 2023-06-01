import 'package:flutter/material.dart';
import 'package:my_agenda/core/utils/colors.dart';
import 'package:my_agenda/features/bottom_sheet/presentation/bloc/botomSheetCubit.dart';

class ColorItem extends StatelessWidget {
 ColorItem({Key? key,required this.isSelected,required this.index,required this.cubit}) : super(key: key);
  bool isSelected;
  int index;
  BottomSheetCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: GestureDetector(
        onTap: () {
          cubit.changeIndex(index);
        },
        child:isSelected? CircleAvatar(
          radius: 15,
          backgroundColor: white,
          child:  CircleAvatar(
            radius: 13,
            backgroundColor: colors[index],
          ),
        ): CircleAvatar(
          radius: 13,
          backgroundColor: colors[index],
        ),
      ),
    );
  }
}
