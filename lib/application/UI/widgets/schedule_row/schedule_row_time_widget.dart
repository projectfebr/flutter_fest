import 'package:flutter/material.dart';
import 'package:flutter_fest/application/UI/themes/app_colors.dart';
import 'package:flutter_fest/application/UI/themes/app_text_styles.dart';
import 'package:flutter_fest/application/UI/widgets/schedule_row/schedule_row_widget.dart';

class ScheduleRowTimeWidget extends StatelessWidget {
  final ScheduleRowTimeWidgetConfiguration configuration;
  const ScheduleRowTimeWidget({Key? key, required this.configuration}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 48,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                configuration.startTime,
                style: AppTextStyles.bookTextSmall.copyWith(color: configuration._style.startColor),
              ),
              Text(
                configuration.finishTime,
                style:
                    AppTextStyles.bookTextSmall.copyWith(color: configuration._style.finishColor),
              ),
            ],
          ),
          const SizedBox(width: 11),
          Column(
            children: [
              Expanded(
                child: _DividerWidget(
                    color: configuration._style.startColor, position: _DividerWidgetPosition.top),
              ),
              Expanded(
                child: _DividerWidget(
                    color: configuration._style.finishColor,
                    position: _DividerWidgetPosition.bottom),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

enum _DividerWidgetPosition { top, bottom }

class _DividerWidget extends StatelessWidget {
  final Color color;
  final _DividerWidgetPosition position;
  const _DividerWidget({Key? key, required this.color, required this.position}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const radius = Radius.circular(1);
    final borderRadius = position == _DividerWidgetPosition.top
        ? const BorderRadius.only(
            topLeft: radius,
            topRight: radius,
          )
        : const BorderRadius.only(
            bottomLeft: radius,
            bottomRight: radius,
          );
    return SizedBox(
      width: 2,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: color,
          borderRadius: borderRadius,
        ),
        child: Container(),
      ),
    );
  }
}

class _ScheduleRowTimeWidgetConfigurationProgressStyle {
  final Color startColor;
  final Color finishColor;

  const _ScheduleRowTimeWidgetConfigurationProgressStyle({
    required this.startColor,
    required this.finishColor,
  });
}

class ScheduleRowTimeWidgetConfiguration {
  final String startTime;
  final String finishTime;
  final ScheduleRowWidgetConfigurationProgressStatus progressStatus;

  _ScheduleRowTimeWidgetConfigurationProgressStyle get _style {
    switch (progressStatus) {
      case ScheduleRowWidgetConfigurationProgressStatus.oncoming:
        return oncomingStyle;
      case ScheduleRowWidgetConfigurationProgressStatus.past:
        return pastStyle;
      case ScheduleRowWidgetConfigurationProgressStatus.current:
        return inProgressStyle;
    }
  }

  ScheduleRowTimeWidgetConfiguration({
    required this.startTime,
    required this.finishTime,
    required this.progressStatus,
  });

  static const oncomingStyle = _ScheduleRowTimeWidgetConfigurationProgressStyle(
    startColor: AppColors.white72,
    finishColor: AppColors.white72,
  );

  static const pastStyle = _ScheduleRowTimeWidgetConfigurationProgressStyle(
    startColor: AppColors.darkText72,
    finishColor: AppColors.darkText72,
  );

  static const inProgressStyle = _ScheduleRowTimeWidgetConfigurationProgressStyle(
    startColor: AppColors.darkText72,
    finishColor: AppColors.green72,
  );
}
