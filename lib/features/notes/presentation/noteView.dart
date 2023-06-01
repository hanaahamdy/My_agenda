import 'package:flutter/material.dart';
import 'package:my_agenda/features/notes/presentation/widgets/note_view_body.dart';

import '../../bottom_sheet/presentation/bottomSheetView.dart';

class NoteView extends StatelessWidget {
  const NoteView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const NoteViewBody(),
      floatingActionButton: buildFloatingActionButton(context),
    );
  }



  FloatingActionButton buildFloatingActionButton(BuildContext context) {
    return FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10))),
              context: context,
              builder: (context) => BottomSheetView());
        });
  }
}
