import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:front_end/data/models/exam/exam.dart';
import 'package:front_end/data/services/exam_service.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {

  final ExamService _examService;

  HomeBloc(this._examService) : super(HomeLoadingState()) {
    on<LoadApiEvent>(_onHomeLoaded);
  }

  _onHomeLoaded(HomeEvent event, Emitter<HomeState> emit) async {
    final List<Exam> exams = await _examService.getExam();
    final List<Exam> hotExams = await _examService.getHotExam();
    emit(HomeLoadedState(exams, hotExams: hotExams));
  }
}
