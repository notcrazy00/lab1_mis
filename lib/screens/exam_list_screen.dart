import 'package:flutter/material.dart';
import '../models/exam.dart';
import '../widgets/exam_card.dart';
import 'exam_details_screen.dart';

class ExamListScreen extends StatelessWidget {
  final String indexNumber;

  const ExamListScreen({
    super.key,
    required this.indexNumber,
  });

  List<Exam> _getExams() {
    final now = DateTime.now();

    return [
      Exam(
        subject: 'Вештачка интелигенција',
        dateTime: DateTime(now.year, now.month - 1, 15, 9, 0),
        rooms: ['АМФ-1', 'АМФ-2'],
      ),
      Exam(
        subject: 'Мобилни информациски системи',
        dateTime: DateTime(now.year, now.month, now.day + 3, 10, 30),
        rooms: ['Л-1'],
      ),
      Exam(
        subject: 'Оперативни системи',
        dateTime: DateTime(now.year, now.month, now.day + 7, 14, 0),
        rooms: ['АМФ-3', 'Л-2'],
      ),
      Exam(
        subject: 'Бази на податоци',
        dateTime: DateTime(now.year, now.month - 2, 20, 11, 0),
        rooms: ['Л-3'],
      ),
      Exam(
        subject: 'Мрежи и комуникации',
        dateTime: DateTime(now.year, now.month, now.day + 12, 9, 30),
        rooms: ['АМФ-1', 'АМФ-4'],
      ),
      Exam(
        subject: 'Веб програмирање',
        dateTime: DateTime(now.year, now.month, now.day + 18, 13, 0),
        rooms: ['Л-1', 'Л-4'],
      ),
      Exam(
        subject: 'Алгоритми и податочни структури',
        dateTime: DateTime(now.year, now.month - 1, 8, 10, 0),
        rooms: ['АМФ-2'],
      ),
      Exam(
        subject: 'Софтверско инженерство',
        dateTime: DateTime(now.year, now.month, now.day + 21, 15, 30),
        rooms: ['АМФ-3', 'Л-2', 'Л-5'],
      ),
      Exam(
        subject: 'Компјутерска графика',
        dateTime: DateTime(now.year, now.month, now.day + 25, 11, 30),
        rooms: ['Л-3'],
      ),
      Exam(
        subject: 'Дискретна математика',
        dateTime: DateTime(now.year, now.month - 1, 28, 8, 30),
        rooms: ['АМФ-4', 'АМФ-5'],
      ),
      Exam(
        subject: 'Компјутерска безбедност',
        dateTime: DateTime(now.year, now.month, now.day + 30, 12, 0),
        rooms: ['Л-4'],
      ),
    ]..sort((a, b) => a.dateTime.compareTo(b.dateTime));
  }

  @override
  Widget build(BuildContext context) {
    final exams = _getExams();

    return Scaffold(
      appBar: AppBar(
        title: Text('Распоред за испити - $indexNumber'),
        backgroundColor: Colors.blue.shade700,
        foregroundColor: Colors.white,
        elevation: 2,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 12),
              itemCount: exams.length,
              itemBuilder: (context, index) {
                final exam = exams[index];
                return ExamCard(
                  exam: exam,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ExamDetailsScreen(exam: exam),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.blue.shade700,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.list_alt,
                  color: Colors.white,
                  size: 24,
                ),
                const SizedBox(width: 12),
                Text(
                  'Вкупно испити: ${exams.length}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
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