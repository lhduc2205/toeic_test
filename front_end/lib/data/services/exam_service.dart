
import 'package:front_end/core/value/constants/app_constants.dart';
import 'package:front_end/data/models/exam/exam.dart';

class ExamService {
  Future<List<Exam>> getExam() async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      Exam(
        title: 'Daily Activity',
        tag: 'daily-activity',
        description: 'What are some of the daily activities that you do at home?',
        image: ImageRasterPath.festival,
        time: 45,
        questionQuantity: 10,
        color: AppColor.primary,
      ),
      Exam(
        title: 'Job',
        tag: 'job-1',
        description:
        'Your work or your study": Are you a student or a worker?asdasdasdasdasdasdasddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd',
        image: ImageRasterPath.animals,
        time: 25,
        questionQuantity: 20,
        color: AppColor.orange,
      ),
      Exam(
        title: 'Job',
        tag: 'job-2',
        description: 'Your work or your study": Are you a student or a worker?',
        image: ImageRasterPath.animals,
        time: 25,
        questionQuantity: 30,
        color: AppColor.red,
      ),
    ];
  }

  Future<List<Exam>> getHotExam() async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      Exam(
        id: 1,
        image: ImageRasterPath.animals,
        tag: 'animal',
        description: 'asdasd',
        title: 'Animal world',
        time: 45,
        questionQuantity: 10,
      ),
      Exam(
        id: 2,
        image: ImageRasterPath.festival,
        tag: 'festival',
        description: 'adasdasd',
        title: 'World festival',
        time: 120,
        questionQuantity: 10,
      ),
    ];
  }
}