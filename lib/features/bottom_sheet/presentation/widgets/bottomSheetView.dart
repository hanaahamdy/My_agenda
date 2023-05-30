import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_agenda/core/utils/widgets/customTextField.dart';
import 'package:my_agenda/features/bottom_sheet/presentation/bloc/botomSheetCubit.dart';
import 'package:my_agenda/features/bottom_sheet/presentation/bloc/bottomSheetStates.dart';
import 'package:my_agenda/features/notes/presentation/Cubit/noteCubit.dart';
import '../../../notes/presentation/widgets/AddButton.dart';

class BottomSheetView extends StatefulWidget {
  BottomSheetView({Key? key}) : super(key: key);

  @override
  State<BottomSheetView> createState() => _BottomSheetViewState();
}

class _BottomSheetViewState extends State<BottomSheetView> {
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomSheetCubit(),
      child: BlocConsumer<BottomSheetCubit, BottomSheetState>(
          listener: (context, state) {
        if (state is AddNoteSuccessState) {
          Navigator.pop(context);
          BlocProvider.of<NoteCubit>(context).fetchNotes();
        }
        if (state is AddNoteErrorState) {
          debugPrint("note don't added");
        }
      }, builder: (context, state) {
        var cubit = BottomSheetCubit.get(context);
        return Form(
          autovalidateMode: autoValidateMode,
          key: cubit.formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * .01,
                ),
                CustomTextField(controller: cubit.titleController,
                    label: "Title"),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .03,
                ),
                CustomTextField(
                  controller: cubit.contentController,
                  label: "Content",
                  maxLines: 4,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .03,
                ),
                AddButton(cubit:cubit,autoValid:autoValidateFunction),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .02,
                ),
              ],
            ),
          ),
        );
      }),
    );
  }



  void autoValidateFunction() {
      setState(() {
      autoValidateMode = AutovalidateMode.always;
    });
  }
}
