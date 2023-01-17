import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app/zoro_music_app.dart';
import 'presentation/bloc/bloc/login/sign_in_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => SignInBloc()),
    ],
    child: const ZoroMusicApp(),
  ));
}
