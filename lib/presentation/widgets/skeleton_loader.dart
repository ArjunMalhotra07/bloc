import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SkeletonLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.black.withOpacity(.3),
      highlightColor: Colors.black.withOpacity(.6),
      child: ListofSkeletonContainer(),
    );
  }
}

class ListofSkeletonContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: 8,
        itemBuilder: (context, index) {
          return SkeletonRowWidget();
        });
  }
}

class SkeletonRowWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SkeletonCustomisableContainerWidget(
              height: 80, width: 80, circularRadius: 70),
          SizedBox(width: 20),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 15),
                Row(
                  children: [
                    Expanded(child: SkeletonCustomisableContainerWidget()),
                    Spacer(),
                    SkeletonCustomisableContainerWidget(width: 10)
                  ],
                ),
                SizedBox(height: 15),
                SkeletonCustomisableContainerWidget(),
                SizedBox(height: 8),
                SkeletonCustomisableContainerWidget(),
                SizedBox(height: 8),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class SkeletonCustomisableContainerWidget extends StatelessWidget {
  SkeletonCustomisableContainerWidget(
      {Key? key, this.height, this.width, this.circularRadius})
      : super(key: key);
  double? height;
  double? width;
  double? circularRadius;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 10,
      width: width,
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(.3),
          borderRadius:
              BorderRadius.all(Radius.circular(circularRadius ?? 10))),
    );
  }
}
