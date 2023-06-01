import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_agenda/features/EditNote/presentaion/Cubit/edit_states.dart';


class EditCubit extends Cubit<EditNoteStates>{
  EditCubit():super(NoteInitState());
  static EditCubit get(BuildContext context){
    return BlocProvider.of(context);
  }
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();


}