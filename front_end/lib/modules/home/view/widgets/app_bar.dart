part of home_view;

class _AppBar extends StatelessWidget {
  const _AppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        OpacityAnimation(
          child: GradientText(
            'EnQuiz',
            style: appTextStyle,
            gradient: AppColor.logoAppGradient,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      showSearch(
                        context: context,
                        delegate: _CustomSearchDelegate(),
                      );
                    },
                    icon: const Icon(
                      IconlyLight.search,
                      color: AppColor.normalText,
                    ),
                  ),
                  SizedBox(width: 10.w),
                  RoundedAvatar(
                    image: ImageRasterPath.festival,
                    onTap: () {
                      context.read<BottomNavbarCubit>().changePage(CurrentPage.profile);
                    }
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _CustomSearchDelegate extends SearchDelegate {
  List<String> searchTopic = ['animal', 'activity', 'career'];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      Visibility(
        visible: query != '',
        child: IconButton(
          icon: const Icon(
            FontAwesomeIcons.xmark,
            color: AppColor.red,
          ),
          onPressed: () {
            query = '';
          },
        ),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(FontAwesomeIcons.arrowLeft),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var topic in searchTopic) {
      if (topic.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(topic);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var topic in searchTopic) {
      if (topic.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(topic);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          onTap: () {
            query = searchTopic[index];
          },
          title: Text(result),
        );
      },
    );
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    return theme.copyWith(
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.brightness == Brightness.dark ? Colors.grey[900] : Colors.white,
        iconTheme: theme.primaryIconTheme.copyWith(color: AppColor.normalText),
      ),
      inputDecorationTheme: searchFieldDecorationTheme ??
          InputDecorationTheme(
            hintStyle: searchFieldStyle ?? theme.inputDecorationTheme.hintStyle,
            border: InputBorder.none,
          ),
    );
  }
}
