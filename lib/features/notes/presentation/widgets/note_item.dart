import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_agenda/features/EditNote/presentaion/Widgets/editView.dart';
import 'package:my_agenda/features/notes/presentation/Cubit/noteCubit.dart';

import '../../../../core/utils/colors.dart';
import '../../data/NoteModel.dart';

class NoteItem extends StatelessWidget {
  NoteModel note;

  NoteItem({Key? key, required this.note}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return GestureDetector(onTap: (){
Navigator.push(context, MaterialPageRoute(builder: (context){
  return EditScreen(noteModel: note,);
}));
    },
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * .02),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color(note.color)
        ),
        child: Column(
          children: [
            ListTile(
              title: Text(
                note.title,
                style: const TextStyle(fontSize: 22),
              ),
              subtitle: Text(
                note.subtitle,
                style: TextStyle(color: black.withOpacity(.4), fontSize: 18),
              ),
              trailing: IconButton(
                  onPressed: () {
                    note.delete();
                    BlocProvider.of<NoteCubit>(context).fetchNotes();
                  },
                  icon: const Icon(Icons.delete)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [Text(DateTime.now().toString().split(" ").first)],
            )
          ],
        ),
      ),
    );
  }
}
