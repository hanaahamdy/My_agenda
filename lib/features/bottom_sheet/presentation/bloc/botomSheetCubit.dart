import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:my_agenda/core/utils/colors.dart';
import 'package:my_agenda/features/bottom_sheet/presentation/bloc/bottomSheetStates.dart';
import 'package:my_agenda/features/notes/data/NoteModel.dart';

class BottomSheetCubit extends Cubit<BottomSheetState> {
  BottomSheetCubit() : super(BottomSheetInitState());

  static BottomSheetCubit get(BuildContext context) {
    return BlocProvider.of(context);
  }
  GlobalKey<FormState> formKey=GlobalKey<FormState>();
TextEditingController titleController=TextEditingController();
  TextEditingController contentController=TextEditingController();
AutovalidateMode autovalidateMode=AutovalidateMode.disabled;
void autoValidate(){
  autovalidateMode=AutovalidateMode.always;
  emit(AutoValidateStateState());
}
  addNote(NoteModel note) async {
    emit(AddNoteLoadingState());
    var notesBox = await Hive.box<NoteModel>(noteBox);
    await notesBox
        .add(note)
        .then((value) => emit(AddNoteSuccessState()))
        .catchError((onError) {
      debugPrint(onError.toString());
      emit(AddNoteErrorState());
    });
  }

  int currentIndex=0;
  Color currentColor=colors[0];
void changeIndex(int index){
  currentIndex=index;
  currentColor=colors[currentIndex];

  emit(ColorItemCurrentIndexState());
}
}
