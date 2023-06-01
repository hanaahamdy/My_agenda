import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_agenda/core/utils/widgets/customTextField.dart';
import 'package:my_agenda/features/EditNote/presentaion/Cubit/edit_states.dart';
import 'package:my_agenda/features/notes/data/NoteModel.dart';
import 'package:my_agenda/features/notes/presentation/Cubit/nooteStates.dart';
import 'package:my_agenda/features/notes/presentation/Cubit/noteCubit.dart';
import 'package:my_agenda/features/notes/presentation/widgets/Custom_Appbar.dart';

import '../Cubit/edit_cubit.dart';

class EditScreen extends StatelessWidget {
  final NoteModel noteModel;



  EditScreen({super.key, required this.noteModel});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: BlocProvider(create: (context)=>EditCubit(),
          child: BlocBuilder<EditCubit, EditNoteStates>(builder: (context, state) {
            EditCubit cubit = BlocProvider.of<EditCubit>(context);
            cubit.titleController.text = noteModel.title;
            cubit.contentController.text = noteModel.subtitle;
      return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
          child: Column(
            children: [
              CustomAppBar(
                icon: Icons.check,
                title: "Edit Note",
                onPressed: () {

                  noteModel.save();
                  BlocProvider.of<NoteCubit>(context).fetchNotes();
                  Navigator.pop(context);
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .03,
              ),
              CustomTextField(
                  onChanged: (value) {
                    noteModel.title=cubit.titleController.text??noteModel.title;
                  }, label: " ", controller: cubit.titleController),
              SizedBox(
                height: MediaQuery.of(context).size.height * .03,
              ),
              CustomTextField(
                onChanged: (value) {
                  noteModel.subtitle=cubit.contentController.text??noteModel.subtitle;
                },
                maxLines: 4,
                label: " ",
                controller: cubit.contentController,
              ),
            ],
          ),
      );
    }),
        ));
  }
}
