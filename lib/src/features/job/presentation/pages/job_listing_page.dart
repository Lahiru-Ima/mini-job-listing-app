import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_listing_app/src/core/di/injector.dart';
import 'package:job_listing_app/src/core/enums/bloc_state_status.dart';
import 'package:job_listing_app/src/features/job/presentation/bloc/job_bloc.dart';
import 'package:job_listing_app/src/features/job/presentation/widgets/job_card.dart';

class JobListingPageWrapper extends StatelessWidget {
  const JobListingPageWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<JobBloc>(create: (context) => sl<JobBloc>()..add(GetJobsEvent()), child: JobListingPage());
  }
}

class JobListingPage extends StatefulWidget {
  const JobListingPage({super.key});

  @override
  State<JobListingPage> createState() => _JobListingPageState();
}

class _JobListingPageState extends State<JobListingPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final isTablet = size.width > 600;

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Text(
          'Job Listings',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: isTablet ? 24 : 20),
        ),
        centerTitle: false,
        forceMaterialTransparency: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.favorite, size: isTablet ? 28 : 24),
            onPressed: () {},
            tooltip: 'WishList',
          ),
          IconButton(
            icon: Icon(Icons.light_mode, size: isTablet ? 28 : 24),
            onPressed: () {},
            tooltip: 'Theme',
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
                      hintText: 'Search jobs...',
                      hintStyle: TextStyle(fontSize: isTablet ? 16 : 14, color: Colors.grey[500]),
                      prefixIcon: Icon(Icons.search, color: Colors.grey[400], size: isTablet ? 24 : 20),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
                        borderSide: BorderSide(color: Colors.grey[300]!),
                      ),

                      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: isTablet ? 16 : 12),
                    ),
                  ),
                ),
                SizedBox(width: size.width * 0.02),
                SizedBox(
                  width: size.width * 0.3,
                  child: ElevatedButton(
                    onPressed: () {
                      context.read<JobBloc>().add(SearchJobsEvent(_searchController.text.trim()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF8B5A96),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    child: Text(
                      'Search',
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.white),
                    ),
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
                      return JobCard(job: job, size: size, isTablet: isTablet);
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
