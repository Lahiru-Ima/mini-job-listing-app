import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_listing_app/src/core/enums/bloc_state_status.dart';
import 'package:job_listing_app/src/features/job/presentation/bloc/job_bloc.dart';
import 'package:job_listing_app/src/features/job/presentation/widgets/job_card.dart';

class FavoriteJobsPage extends StatefulWidget {
  const FavoriteJobsPage({super.key});

  @override
  State<FavoriteJobsPage> createState() => _FavoriteJobsPageState();
}

class _FavoriteJobsPageState extends State<FavoriteJobsPage> {
  @override
  void initState() {
    super.initState();
    context.read<JobBloc>().add(const LoadFavoritesEvent());
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    Size size = MediaQuery.of(context).size;
    final isTablet = size.width > 600;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Favorite Jobs',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: isTablet ? 24 : 20, color: theme.colorScheme.onSurface),
        ),
        centerTitle: false,
        backgroundColor: theme.colorScheme.surface,
        foregroundColor: theme.colorScheme.onSurface,
        elevation: 0,
        actions: [
          BlocBuilder<JobBloc, JobState>(
            builder: (context, state) {
              if (state.favoriteJobs.isNotEmpty) {
                return TextButton(
                  child: Text('Clear All'),
                  onPressed: () {
                    context.read<JobBloc>().add(const ClearAllFavoritesEvent());
                  },
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ],
      ),
      body: BlocBuilder<JobBloc, JobState>(
        builder: (context, state) {
          if (state.status == BlocStateStatus.loadInProgress) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.status == BlocStateStatus.loadFailure) {
            return Center(
              child: Text(state.errorMessage ?? 'An error occurred', style: TextStyle(color: theme.colorScheme.error)),
            );
          } else {
            final jobs = state.favoriteJobs;
            if (jobs.isEmpty) {
              return Center(child: Text('No favorite jobs found', style: theme.textTheme.bodyLarge));
            }
            return ListView.builder(
              itemCount: jobs.length,
              itemBuilder: (context, index) {
                final job = jobs[index];
                return JobCard(job: job, size: size, isTablet: isTablet);
              },
            );
          }
        },
      ),
    );
  }
}
