import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:job_listing_app/src/features/job/domain/entities/job_entity.dart';

class JobDetailsPage extends StatelessWidget {
  final JobEntity job;
  const JobDetailsPage({super.key, required this.job});

  String getFormattedDate(int timestamp) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    String formattedDate = DateFormat('yyyy-MM-dd').format(date);
    return formattedDate;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    Size size = MediaQuery.of(context).size;
    final isTablet = size.width > 600;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Job Details',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: isTablet ? 24 : 18, color: theme.colorScheme.onSurface),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite_border, size: isTablet ? 28 : 24, color: theme.colorScheme.onSurface),
            onPressed: () {},
            tooltip: 'Add to Favorites',
          ),
        ],
        backgroundColor: theme.colorScheme.surface,
        foregroundColor: theme.colorScheme.onSurface,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: isTablet ? 24 : 16),

            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(job.title, style: theme.textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold, height: 1.3)),
                      const SizedBox(height: 20),

                      Row(
                        children: [
                          Icon(Icons.work_outline, size: 18, color: theme.colorScheme.onSurface.withOpacity(0.7)),
                          const SizedBox(width: 8),
                          Text(
                            job.companyName,
                            style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500, color: theme.colorScheme.onSurface.withOpacity(0.8)),
                          ),
                          const SizedBox(width: 24),
                          Icon(Icons.location_on_outlined, size: 18, color: theme.colorScheme.onSurface.withOpacity(0.7)),
                          const SizedBox(width: 8),
                          Text(
                            job.location,
                            style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500, color: theme.colorScheme.onSurface.withOpacity(0.8)),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),

                      Row(
                        children: [
                          Icon(Icons.access_time, size: 18, color: theme.colorScheme.onSurface.withOpacity(0.7)),
                          const SizedBox(width: 8),
                          Text('Posted Date: ${getFormattedDate(job.postDate)}', style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurface.withOpacity(0.7))),
                        ],
                      ),
                      const SizedBox(height: 20),

                      Wrap(
                        spacing: 12,
                        runSpacing: 8,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                            decoration: BoxDecoration(
                              color: theme.colorScheme.primary.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: theme.colorScheme.primary.withOpacity(0.3)),
                            ),
                            child: Text(
                              job.jobType,
                              style: TextStyle(fontSize: 12, color: theme.colorScheme.primary, fontWeight: FontWeight.w600),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                            decoration: BoxDecoration(
                              color: Colors.orange.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.orange.withOpacity(0.3)),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.calendar_today, size: 12, color: Colors.orange[700]),
                                const SizedBox(width: 6),
                                Text(
                                  'Deadline: ${getFormattedDate(job.expireyDate)}',
                                  style: TextStyle(fontSize: 12, color: Colors.orange[700], fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.description_outlined, size: 20, color: theme.colorScheme.primary),
                          const SizedBox(width: 8),
                          Text('Job Description', style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Text(job.description, style: theme.textTheme.bodyMedium?.copyWith(height: 1.6, letterSpacing: 0.2, color: theme.colorScheme.onSurface.withOpacity(0.8))),
                      const SizedBox(height: 16),
                      Divider(color: theme.colorScheme.onSurface.withOpacity(0.1)),
                      const SizedBox(height: 16),
                      Text(
                        'Salary: ${job.salary.toString()} LKR',
                        style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600, color: theme.colorScheme.primary),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 32),
          ],
        ),
      ),

      // Apply Button
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          boxShadow: [BoxShadow(color: theme.shadowColor.withOpacity(0.1), blurRadius: 10, offset: const Offset(0, -5))],
        ),
        child: SafeArea(
          child: SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                _showApplyDialog(context);
              },
              child: Text(
                'Apply Now',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: theme.colorScheme.onPrimary),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showApplyDialog(BuildContext context) {
    final theme = Theme.of(context);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: theme.colorScheme.surface,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: Text('Apply for Position', style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
          content: Text('Are you sure you want to apply for this position?', style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurface.withOpacity(0.8))),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel', style: TextStyle(color: theme.colorScheme.onSurface.withOpacity(0.6))),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text('Application submitted successfully!'),
                    backgroundColor: theme.colorScheme.primary,
                    behavior: SnackBarBehavior.floating,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
              child: Text(
                'Apply',
                style: TextStyle(color: theme.colorScheme.onPrimary, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        );
      },
    );
  }
}
