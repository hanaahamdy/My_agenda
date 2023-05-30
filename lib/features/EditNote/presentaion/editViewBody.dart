import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_agenda/core/utils/widgets/customTextField.dart';
import 'package:my_agenda/features/notes/data/NoteModel.dart';
import 'package:my_agenda/features/notes/presentation/Cubit/nooteStates.dart';
import 'package:my_agenda/features/notes/presentation/Cubit/noteCubit.dart';
class EditScreen extends StatelessWidget {
  NoteModel noteModel;
   EditScreen({Key? key,required this.noteModel}) : super(key: key);
TextEditingController titleController=TextEditingController();
  TextEditingController contentController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    titleController.text=noteModel.title;
    contentController.text=noteModel.subtitle;
    return  Scaffold(
      body: BlocBuilder<NoteCubit,NoteStates>(

       builder:(context,state){
         NoteCubit cubit=BlocProvider.of<NoteCubit>(context);
         return Column(children: [
          CustomTextField(label: " ",controller:titleController ),
          CustomTextField(label: " ",controller: contentController,),

        ],);}
      ),
    );
  }
}
