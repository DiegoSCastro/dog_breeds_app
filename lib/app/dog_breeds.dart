import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app.dart';
import 'features/home/home_cubit.dart';

class DogBreedsApp extends StatelessWidget {
  const DogBreedsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<HomeCubit>()),
      ],
      child: MaterialApp(
        title: 'Dog breeds',
        debugShowCheckedModeBanner: false,
        theme: ThemeConfig.theme,
        initialRoute: '/',
        routes: {
          '/': (_) => const SplashPage(),
          '/home': (_) => const HomePage(),
        },
      ),
    );
  }
}
