import 'package:flutter/material.dart';

class JobListingPage extends StatelessWidget {
  const JobListingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Job Listings'),
      ),
      body: const Center(
        child: Text('List of Jobs'),
      ),
    );
  }
}