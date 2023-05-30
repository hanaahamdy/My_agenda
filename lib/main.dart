import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:my_agenda/core/utils/colors.dart';
import 'package:my_agenda/features/notes/presentation/Cubit/noteCubit.dart';
import 'package:my_agenda/features/notes/presentation/noteView.dart';

import 'core/utils/theme.dart';
import 'features/notes/data/NoteModel.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
 await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
 await Hive.openBox<NoteModel>(noteBox);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context)=>NoteCubit()..fetchNotes(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: appTheme(),
        home:const NoteView()
      ),
    );
  }
}

