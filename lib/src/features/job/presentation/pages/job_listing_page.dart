import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_listing_app/src/core/enums/bloc_state_status.dart';
import 'package:job_listing_app/src/features/job/presentation/bloc/job_bloc.dart';
import 'package:job_listing_app/src/features/job/presentation/pages/favorite_jobs_page.dart';
import 'package:job_listing_app/src/features/job/presentation/widgets/job_card.dart';
import 'package:job_listing_app/src/shared/theme/theme_cubit.dart';

class JobListingPage extends StatefulWidget {
  const JobListingPage({super.key});

  @override
  State<JobListingPage> createState() => _JobListingPageState();
}

class _JobListingPageState extends State<JobListingPage> {
  final TextEditingController _searchController = TextEditingController();

  void _toggleTheme() {
    context.read<ThemeCubit>().toggleTheme();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    Size size = MediaQuery.of(context).size;
    final isTablet = size.width > 600;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Job Listings',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: isTablet ? 24 : 20, color: theme.colorScheme.onSurface),
        ),
        centerTitle: false,
        backgroundColor: theme.colorScheme.surface,
        foregroundColor: theme.colorScheme.onSurface,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.favorite_border, size: isTablet ? 28 : 24),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (context) => BlocProvider.value(value: context.read<JobBloc>(), child: const FavoriteJobsPage()),
                ),
              );
            },
            tooltip: 'Favorites',
          ),
          BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, themeState) {
              return IconButton(
                icon: Icon(themeState.mode == ThemeMode.light ? Icons.dark_mode : Icons.light_mode, size: isTablet ? 28 : 24),
                onPressed: _toggleTheme,
                tooltip: themeState.mode == ThemeMode.light ? 'Dark Mode' : 'Light Mode',
              );
            },
          ),
          SizedBox(width: size.width * 0.02),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    onSubmitted: (value) {
                      context.read<JobBloc>().add(SearchJobsEvent(value));
                    },
                    decoration: InputDecoration(
                      hintText: 'Search by title or location...',
                      prefixIcon: Icon(Icons.search, size: isTablet ? 24 : 20),
                    ),
                  ),
                ),
                SizedBox(width: size.width * 0.02),
                SizedBox(
                  width: size.width * 0.25,
                  child: ElevatedButton(
                    onPressed: () {
                      context.read<JobBloc>().add(SearchJobsEvent(_searchController.text.trim()));
                    },
                    child: Text('Search', style: TextStyle(fontSize: isTablet ? 14 : 12)),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: BlocBuilder<JobBloc, JobState>(
              builder: (context, state) {
                if (state.status == BlocStateStatus.loadInProgress) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state.status == BlocStateStatus.loadFailure) {
                  return Center(
                    child: Text(state.errorMessage ?? 'An error occurred', style: TextStyle(color: theme.colorScheme.error)),
                  );
                } else if (state.status == BlocStateStatus.loadSuccess) {
                  final jobs = state.jobData ?? [];
                  if (jobs.isEmpty) {
                    return Center(child: Text('No jobs found', style: theme.textTheme.bodyLarge));
                  }
                  return ListView.builder(
                    itemCount: jobs.length,
                    itemBuilder: (context, index) {
                      final job = jobs[index];
                      return JobCard(job: job, size: size, isTablet: isTablet);
                    },
                  );
                } 
                else {
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
