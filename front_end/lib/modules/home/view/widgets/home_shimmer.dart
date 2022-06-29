part of home_view;

class _HomeShimmer extends StatelessWidget {
  const _HomeShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppStyle.defaultSpacing,
            vertical: 10.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BasicShimmer(
                    child: Container(
                      color: Colors.white,
                      height: 30.w,
                      width: 150.w,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          BasicShimmer(
                            child: Container(
                              color: Colors.white,
                              height: 40.w,
                              width: 40.w,
                            ),
                          ),
                          SizedBox(width: 10.w),
                          BasicShimmer(
                            child: Container(
                              color: Colors.white,
                              height: 40.w,
                              width: 40.w,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 30.h),
              BasicShimmer(
                child: Container(
                  color: Colors.white,
                  width: 100.w,
                  height: 30.h,
                ),
              ),
              SizedBox(height: 10.h),
              // Container(
              //   padding: EdgeInsets.symmetric(
              //     horizontal: AppStyle.defaultSpacing,
              //   ),
              //   child: Column(
              //     mainAxisSize: MainAxisSize.min,
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       SizedBox(height: MediaQuery.of(context).padding.top),
              //       _HotTopicList(hotExams: []),
              //       SizedBox(height: 15.h),
              //       // _TagList(exams: exams),
              //       // SizedBox(height: 10.h),
              //       // _ExamList(exams: exams),
              //       SizedBox(height: 10.h),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
