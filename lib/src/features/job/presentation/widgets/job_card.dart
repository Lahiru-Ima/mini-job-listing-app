import 'package:flutter/material.dart';
import 'package:job_listing_app/src/features/job/domain/entities/job_entity.dart';
import 'package:job_listing_app/src/features/job/presentation/pages/job_details_page.dart';

class JobCard extends StatelessWidget {
  const JobCard({super.key, required this.job, required this.size, required this.isTablet});

  final JobEntity job;
  final Size size;
  final bool isTablet;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute<void>(builder: (context) => JobDetailsPage(job: job)));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(job.title, style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600)),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          SizedBox(
                            width: size.width * 0.3,
                            child: Text(
                              job.companyName,
                              style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurface.withOpacity(0.7)),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: theme.colorScheme.primary.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(color: theme.colorScheme.primary.withOpacity(0.3)),
                            ),
                            child: Text(
                              job.jobType,
                              style: TextStyle(fontSize: 12, color: theme.colorScheme.primary, fontWeight: FontWeight.w500),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Icon(Icons.location_on, size: 16, color: theme.colorScheme.onSurface.withOpacity(0.6)),
                          const SizedBox(width: 4),
                          Text(job.location, style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurface.withOpacity(0.7))),
                        ],
                      ),
                    ],
                  ),
                ),
                Icon(Icons.arrow_forward_ios, size: 16, color: theme.colorScheme.onSurface.withOpacity(0.4)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
