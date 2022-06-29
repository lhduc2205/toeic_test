part of 'home_bloc.dart';

@immutable
abstract class HomeState extends Equatable {}

class HomeLoadingState extends HomeState {
  @override
  List<Object?> get props => [];
}

class HomeLoadedState extends HomeState {
  HomeLoadedState(this.exams, {this.hotExams});

  final List<Exam> exams;
  final List<Exam>? hotExams;


  @override
  List<Object?> get props => [exams];
}
