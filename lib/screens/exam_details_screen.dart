import 'package:flutter/material.dart';
import '../models/exam.dart';

class ExamDetailsScreen extends StatelessWidget {
  final Exam exam;

  const ExamDetailsScreen({
    super.key,
    required this.exam,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Детали за испит'),
        backgroundColor: Colors.blue.shade700,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: exam.isPassed
                      ? [Colors.grey.shade400, Colors.grey.shade600]
                      : [Colors.blue.shade400, Colors.blue.shade700],
                ),
              ),
              child: Column(
                children: [
                  Icon(
                    exam.isPassed ? Icons.event_available : Icons.event,
                    size: 72,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    exam.subject,
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  _buildInfoCard(
                    icon: Icons.calendar_month,
                    title: 'Датум',
                    content: exam.formattedDate,
                    color: Colors.orange,
                  ),
                  const SizedBox(height: 16),
                  _buildInfoCard(
                    icon: Icons.access_time_filled,
                    title: 'Време',
                    content: exam.formattedTime,
                    color: Colors.green,
                  ),
                  const SizedBox(height: 16),
                  _buildInfoCard(
                    icon: Icons.meeting_room_outlined,
                    title: 'Простории',
                    content: exam.rooms.join('\n'),
                    color: Colors.purple,
                  ),
                  const SizedBox(height: 24),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: exam.isPassed
                          ? Colors.grey.shade200
                          : Colors.blue.shade50,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: exam.isPassed
                            ? Colors.grey.shade400
                            : Colors.blue.shade200,
                        width: 2,
                      ),
                    ),
                    child: Column(
                      children: [
                        Icon(
                          exam.isPassed ? Icons.history : Icons.timer,
                          size: 48,
                          color: exam.isPassed
                              ? Colors.grey.shade600
                              : Colors.blue.shade700,
                        ),
                        const SizedBox(height: 12),
                        Text(
                          exam.isPassed ? 'Статус' : 'Преостанува',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey.shade700,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          exam.getTimeRemaining(),
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: exam.isPassed
                                ? Colors.grey.shade700
                                : Colors.blue.shade800,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard({
    required IconData icon,
    required String title,
    required String content,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withOpacity(0.15),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              icon,
              color: color,
              size: 28,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  content,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}