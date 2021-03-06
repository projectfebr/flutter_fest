import 'package:flutter/material.dart';
import 'package:flutter_fest/application/UI/themes/app_colors.dart';
import 'package:flutter_fest/application/UI/widgets/schedule_row/schedule_row_brake_widget.dart';
import 'package:flutter_fest/application/UI/widgets/schedule_row/schedule_row_widget.dart';
import 'package:flutter_fest/resources/resources.dart';

class ScheduleWidget extends StatelessWidget {
  const ScheduleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final topInset = MediaQuery.of(context).padding.top;

    return SafeArea(
      top: false,
      child: CustomScrollView(
        slivers: [
          const _LogoWidget(),
          SliverPersistentHeader(
            pinned: true,
            delegate: _SliverAppBarDelegate(topInset: topInset),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                if (index == 2) {
                  return const Padding(
                    padding: EdgeInsets.only(top: 16, left: 14, right: 14),
                    child: SizedBox(
                      height: 70,
                      child: ScheduleRowBrakeWidget(),
                    ),
                  );
                }
                return Padding(
                  padding: const EdgeInsets.only(top: 16, left: 20, right: 20),
                  child: ScheduleRowWidget.single(),
                );
              },
              childCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}

class _LogoWidget extends StatelessWidget {
  const _LogoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 204,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              child: Image.asset(AppImages.sheduleBg),
            ),
            Positioned(
              top: 84,
              left: 20,
              child: Image.asset(AppImages.sheduleFfLogo),
            ),
            Positioned(
              top: 65,
              right: 20,
              child: Image.asset(AppImages.sheduleSurfLogo),
            ),
          ],
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double _height = 56;
  final double topInset;

  _SliverAppBarDelegate({required this.topInset});

  @override
  double get minExtent => _height + topInset;
  @override
  double get maxExtent => _height + topInset;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return _SectionsButtonsWidget(topInset: topInset);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}

class _SectionsButtonsWidget extends StatelessWidget {
  const _SectionsButtonsWidget({Key? key, required this.topInset}) : super(key: key);

  final double topInset;

  @override
  Widget build(BuildContext context) {
    const totalItem = 4;
    const startGradientPoint = 1;
    const itemGradientWidth = 2;
    const halfItemGradientWidth = itemGradientWidth / 2;
    const endGradientPoint = totalItem * itemGradientWidth + halfItemGradientWidth;
    return Container(
      padding: EdgeInsets.only(top: topInset),
      color: Theme.of(context).scaffoldBackgroundColor,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        scrollDirection: Axis.horizontal,
        itemCount: totalItem,
        itemBuilder: (context, index) {
          final currentGradientStartPoint = -(startGradientPoint + index * itemGradientWidth);
          final currentGradientEndPoint = endGradientPoint + currentGradientStartPoint;

          return Center(
            child: SizedBox(
              height: 36,
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                  padding: MaterialStateProperty.all(EdgeInsets.zero),
                  elevation: MaterialStateProperty.all(0),
                  minimumSize: MaterialStateProperty.all(Size.zero),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                ),
                child: Ink(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment(currentGradientStartPoint.toDouble(), 0),
                          end: Alignment(currentGradientEndPoint.toDouble(), 0),
                          colors: const [AppColors.green, AppColors.blue]),
                      borderRadius: const BorderRadius.all(Radius.circular(18))),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text('???????????? $index'),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            width: 10,
          );
        },
      ),
    );
  }
}
