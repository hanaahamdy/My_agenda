import 'package:flutter/material.dart';
import '../../../bottom_sheet/presentation/bloc/botomSheetCubit.dart';
import '../../data/NoteModel.dart';
class AddButton extends StatelessWidget {
  AddButton({Key? key, required this.cubit, required this.autoValid})
      : super(key: key);
  final BottomSheetCubit cubit;
  VoidCallback autoValid;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          if (cubit.formKey.currentState!.validate()) {
            NoteModel model = NoteModel(
                title: cubit.titleController.text,
                color: Colors.orangeAccent.value,
                subtitle: cubit.contentController.text,
                date: DateTime.now().toString().split(" ").first);
            cubit.addNote(model);
          } else {
            autoValid();
          }
        },
        child: const Text("Add"),
      ),
    );
  }
}
