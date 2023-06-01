import 'package:flutter/material.dart';
import 'package:my_agenda/core/utils/colors.dart';
import 'package:my_agenda/features/bottom_sheet/presentation/widgets/ColorItem.dart';

import '../bloc/botomSheetCubit.dart';

class ColorsListView extends StatelessWidget {
  ColorsListView({Key? key, required this.cubit}) : super(key: key);

  BottomSheetCubit cubit;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: colors.length,
          itemBuilder: (context, index) => ColorItem(
                cubit: cubit,
                index: index,
                isSelected: cubit.currentIndex == index ? true : false,
              )),
    );
  }
}
