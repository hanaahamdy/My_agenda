import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_agenda/features/notes/data/NoteModel.dart';
import 'package:my_agenda/features/notes/presentation/Cubit/nooteStates.dart';
import 'package:my_agenda/features/notes/presentation/Cubit/noteCubit.dart';
import 'Custom_Appbar.dart';
import 'note_item.dart';

class NoteViewBody extends StatelessWidget {
  const NoteViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(11),
      child: Column(
        children: [
          const CustomAppBar(
            icon: Icons.search,
            title: "Notes",
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: BlocBuilder<NoteCubit,NoteStates>(
                builder: (context, state) {
                  List<NoteModel>list=BlocProvider.of<NoteCubit>(context).notesList;
                  return ListView.builder(
                      itemCount: list.length,
                      itemBuilder: (context, index) =>  NoteItem(note:list[index]));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
