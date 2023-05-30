
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:my_agenda/core/utils/colors.dart';
import 'package:my_agenda/features/notes/presentation/Cubit/nooteStates.dart';

import '../../data/NoteModel.dart';

class NoteCubit extends Cubit<NoteStates>{
  NoteCubit():super(NoteInitState());
  static NoteCubit get(BuildContext context){
    return BlocProvider.of(context);
  }
List<NoteModel>notesList=[];
 fetchNotes(){
   var notseBox=Hive.box<NoteModel>(noteBox);
   notesList=notseBox.values.toList();
   emit(GetNotesSuccessState());

 }

}