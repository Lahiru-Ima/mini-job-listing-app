import 'package:flutter/material.dart';
import 'package:job_listing_app/src/core/config/env_config.dart';
import 'package:job_listing_app/src/core/di/injector.dart';
import 'package:job_listing_app/src/features/job/presentation/pages/job_listing_page.dart';

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
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: JobListingPageWrapper(),
    );
  }
}
