import 'package:flutter/material.dart';
import 'package:flutter_fest/application/UI/screens/main_tabs/main_tabs_view_model.dart';
import 'package:flutter_fest/application/UI/screens/main_tabs/schedule_widget.dart';
import 'package:flutter_fest/resources/resources.dart';
import 'package:provider/provider.dart';

class MainTabsScreen extends StatelessWidget {
  const MainTabsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _BodyWidget(),
      bottomNavigationBar: _NavBarWidget(),
    );
  }
}

class _BodyWidget extends StatelessWidget {
  const _BodyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentIndex =
        context.select<MainTabsViewModel, int>((vm) => vm.currentTabIndex);
    return IndexedStack(
      index: currentIndex,
      children: const [
        ScheduleWidget(),
        Center(
          child: Text(
            '2',
            style: TextStyle(color: Colors.green, fontSize: 40),
          ),
        ),
        Center(
          child: Text(
            '3',
            style: TextStyle(color: Colors.green, fontSize: 40),
          ),
        ),
      ],
    );
  }
}

class _NavBarWidget extends StatelessWidget {
  const _NavBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentIndex =
        context.select<MainTabsViewModel, int>((vm) => vm.currentTabIndex);
    final model = context.read<MainTabsViewModel>();
    final theme = Theme.of(context).bottomNavigationBarTheme;

    final buttons = [
      _BottomBarItemFactory(AppImages.tabbarCalendar, 'Расписание'),
      _BottomBarItemFactory(AppImages.tabbarBookmark, 'Избранное'),
      _BottomBarItemFactory(AppImages.tabbarPoint, 'Как добраться'),
    ]
        .asMap()
        .map((index, value) {
          return MapEntry(index, value.build(index, currentIndex, theme));
        })
        .values
        .toList();

    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: model.setCurrentTabIndex,
      items: buttons,
    );
  }
}

class _BottomBarItemFactory {
  final String iconName;
  final String tooltip;

  _BottomBarItemFactory(this.iconName, this.tooltip);

  BottomNavigationBarItem build(
      int index, int currentIndex, BottomNavigationBarThemeData theme) {
    final color = index == currentIndex
        ? theme.selectedItemColor
        : theme.unselectedItemColor;
    return BottomNavigationBarItem(
      label: '',
      icon: Image.asset(
        iconName,
        color: color,
      ),
      tooltip: tooltip,
    );
  }
}
