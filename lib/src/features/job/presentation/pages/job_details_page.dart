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
    Size size = MediaQuery.of(context).size;
    final isTablet = size.width > 600;
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Text(
          'Back to Jobs',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: isTablet ? 24 : 18),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite, size: isTablet ? 28 : 24),
            onPressed: () {},
          ),
        ],
        forceMaterialTransparency: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: isTablet ? 24 : 16),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: Offset(0, 2))],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    job.title,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black87, height: 1.3),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Icon(Icons.work_outline, size: 18, color: Colors.grey[600]),
                      SizedBox(width: 8),
                      Text(
                        job.companyName,
                        style: TextStyle(fontSize: 14, color: Colors.grey[700], fontWeight: FontWeight.w500),
                      ),
                      SizedBox(width: 24),
                      Icon(Icons.location_on_outlined, size: 18, color: Colors.grey[600]),
                      SizedBox(width: 8),
                      Text(
                        job.location,
                        style: TextStyle(fontSize: 14, color: Colors.grey[700], fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Icon(Icons.access_time, size: 18, color: Colors.grey[600]),
                      SizedBox(width: 8),
                      Text('Posted Date : ${getFormattedDate(job.postDate)}', style: TextStyle(fontSize: 14, color: Colors.grey[600])),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: Color(0xFF8B5A96).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Color(0xFF8B5A96).withOpacity(0.3)),
                        ),
                        child: Text(
                          job.jobType,
                          style: TextStyle(fontSize: 12, color: Color(0xFF8B5A96), fontWeight: FontWeight.w600),
                        ),
                      ),
                      SizedBox(width: 12),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.orange.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.orange.withOpacity(0.3)),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.calendar_today, size: 12, color: Colors.orange[700]),
                            SizedBox(width: 6),
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
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: Offset(0, 2))],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.description_outlined, size: 20, color: Color(0xFF8B5A96)),
                      SizedBox(width: 8),
                      Text(
                        'Job Description',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(job.description, style: TextStyle(fontSize: 15, color: Colors.grey[700], height: 1.6, letterSpacing: 0.2)),
                  SizedBox(height: 8),
                  Divider(),
                  SizedBox(height: 8),
                  Text('Salary: ${job.salary.toString()} LKR', style: TextStyle(fontWeight: FontWeight.w500)),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 10, offset: Offset(0, -5))],
        ),
        child: SafeArea(
          child: SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                _showApplyDialog(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF8B5A96),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                elevation: 2,
              ),
              child: Text(
                'Apply Now',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showApplyDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: Text(
            'Apply for Position',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
          ),
          content: Text('Are you sure you want to apply for this position?', style: TextStyle(color: Colors.grey[700])),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel', style: TextStyle(color: Colors.grey[600])),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Application submitted successfully!'), backgroundColor: Color(0xFF8B5A96)));
              },
              style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
              child: Text('Apply', style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }
}
