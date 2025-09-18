import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_listing_app/src/core/di/injector.dart';
import 'package:job_listing_app/src/core/enums/bloc_state_status.dart';
import 'package:job_listing_app/src/features/job/presentation/bloc/job_bloc.dart';

class JobListingPageWrapper extends StatelessWidget {
  const JobListingPageWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<JobBloc>(create: (context) => sl<JobBloc>()..add(GetJobsEvent()), child: JobListingPage());
  }
}

class JobListingPage extends StatelessWidget {
  const JobListingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text('Job Listings', style: TextStyle(fontWeight: FontWeight.w600)),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        elevation: 0,
      ),
      body: Column(
        children: [
          //search box
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search jobs...',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
              ),
            ),
          ),
          //job listings
          Expanded(
            child: BlocBuilder<JobBloc, JobState>(
              builder: (context, state) {
                if (state.status == BlocStateStatus.loadInProgress) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state.status == BlocStateStatus.loadFailure) {
                  return Center(child: Text(state.errorMessage ?? 'An error occurred'));
                } else if (state.status == BlocStateStatus.loadSuccess) {
                  final jobs = state.jobData ?? [];
                  if (jobs.isEmpty) {
                    return const Center(child: Text('No jobs found'));
                  }
                  return ListView.builder(
                    itemCount: jobs.length,
                    itemBuilder: (context, index) {
                      final job = jobs[index];
                      return ListTile(
                        title: Text(job.title, style: TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Text(job.companyName),
                        trailing: Text(job.location),
                      );
                    },
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
