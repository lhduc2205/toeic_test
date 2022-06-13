part of bottom_navbar_cubit;

enum CurrentPage { home, profile }

class BottomNavbarState extends Equatable {
  const BottomNavbarState({this.currentPage = CurrentPage.home});

  final CurrentPage currentPage;

  @override
  List<Object?> get props => [currentPage];

  BottomNavbarState copyWith({CurrentPage? currentPage}) {
    return BottomNavbarState(
      currentPage: currentPage ?? this.currentPage,
    );
  }

  int currentPageToInt() {
    switch(currentPage) {
      case CurrentPage.home: return 0;
      case CurrentPage.profile: return 1;
    }
  }
}
