import 'package:flutter/material.dart';
import '../models/exam.dart';

class ExamCard extends StatelessWidget {
  final Exam exam;
  final VoidCallback onTap;

  const ExamCard({
    super.key,
    required this.exam,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final cardColor = exam.isPassed
        ? Colors.grey.shade300
        : Colors.blue.shade50;

    final textColor = exam.isPassed
        ? Colors.grey.shade600
        : Colors.black87;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      color: cardColor,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: exam.isPassed
                          ? Colors.grey.shade400
                          : Colors.blue.shade100,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      exam.isPassed ? Icons.check_circle : Icons.school,
                      color: exam.isPassed
                          ? Colors.grey.shade700
                          : Colors.blue.shade700,
                      size: 28,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      exam.subject,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: textColor,
                        decoration: exam.isPassed
                            ? TextDecoration.lineThrough
                            : null,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Icon(
                    Icons.calendar_today,
                    size: 18,
                    color: textColor.withOpacity(0.7),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    exam.formattedDate,
                    style: TextStyle(
                      fontSize: 15,
                      color: textColor,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Icon(
                    Icons.access_time,
                    size: 18,
                    color: textColor.withOpacity(0.7),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    exam.formattedTime,
                    style: TextStyle(
                      fontSize: 15,
                      color: textColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Icon(
                    Icons.meeting_room,
                    size: 18,
                    color: textColor.withOpacity(0.7),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      exam.rooms.join(', '),
                      style: TextStyle(
                        fontSize: 15,
                        color: textColor,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}