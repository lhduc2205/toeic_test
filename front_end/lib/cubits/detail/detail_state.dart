part of detail_bloc;

abstract class DetailState extends Equatable{
  const DetailState();
}

class DetailLoadingState extends DetailState {
  @override
  List<Object?> get props => [];
}

class DetailLoadedState extends DetailState {
  const DetailLoadedState(this.selectedAnswer);

  final int selectedAnswer;

  @override
  List<Object?> get props => [selectedAnswer];
}
