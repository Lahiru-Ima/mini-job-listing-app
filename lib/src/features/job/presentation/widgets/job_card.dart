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
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute<void>(builder: (context) => JobDetailsPage(job: job)));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: Offset(0, 2))],
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      job.title,
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black87),
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        SizedBox(
                          width: size.width * 0.3,
                          child: Text(
                            job.companyName,
                            style: TextStyle(fontSize: isTablet ? 16 : 14, color: Colors.grey[600]),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(width: 12),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(color: Colors.grey[300]!),
                          ),
                          child: Text(
                            job.jobType,
                            style: TextStyle(fontSize: 12, color: Colors.grey[700], fontWeight: FontWeight.w500),
                          ),
                        ),
                        SizedBox(width: 12),
                        Icon(Icons.location_on, size: 16, color: Colors.grey[500]),
                        SizedBox(width: 4),
                        Text(job.location, style: TextStyle(fontSize: 14, color: Colors.grey[600])),
                      ],
                    ),
                  ],
                ),
              ),
              Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey[400]),
            ],
          ),
        ),
      ),
    );
  }
}
