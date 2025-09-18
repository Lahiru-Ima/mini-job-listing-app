import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_listing_app/src/core/config/env_config.dart';
import 'package:job_listing_app/src/core/di/injector.dart';
import 'package:job_listing_app/src/core/theme/app_theme.dart';
import 'package:job_listing_app/src/features/job/presentation/bloc/job_bloc.dart';
import 'package:job_listing_app/src/features/job/presentation/pages/job_listing_page.dart';
import 'package:job_listing_app/src/shared/theme/theme_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EnvConfig.load();
  await initDependencies();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ThemeCubit(sl())..load()),
        BlocProvider(create: (context) => sl<JobBloc>()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, themeState) {
          return MaterialApp(
            title: 'Job Listing App',
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: themeState.mode,
            debugShowCheckedModeBanner: false,
            home: const JobListingPageWrapper(),
          );
        },
      ),
    );
  }
}
