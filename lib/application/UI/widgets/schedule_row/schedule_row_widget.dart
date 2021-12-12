import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_fest/application/UI/widgets/schedule_row/schedule_row_session_widget.dart';
import 'package:flutter_fest/application/UI/widgets/schedule_row/schedule_row_time_widget.dart';

abstract class ScheduleRowWidget extends StatelessWidget {
  const ScheduleRowWidget({Key? key}) : super(key: key);

  factory ScheduleRowWidget.single({Key? key}) =>
      _ScheduleRowSingleSessionWidget(
        key: key,
      );

  factory ScheduleRowWidget.multi({Key? key}) => _ScheduleRowMultiSessionWidget(
        key: key,
      );
}

class _ScheduleRowSingleSessionWidget extends ScheduleRowWidget {
  const _ScheduleRowSingleSessionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const progressStatus = ScheduleRowWidgetConfigurationProgressStatus.current;
    final configuration = ScheduleRowSessionWidgetConfiguration(
      avatarUrl:
          'https://www.meme-arsenal.com/memes/54f17b77ced3591bebe54c4f1cb32967.jpg',
      speakerName: 'Алексей Чулпин',
      sessionTitle: 'Субъективность в оценке дизайна',
      isFavorite: false,
      progressStatus: progressStatus,
    );

    final ddd = ScheduleRowTimeWidgetConfiguration(
      finishTime: '10:00',
      startTime: '8:00',
      progressStatus: progressStatus,
    );
    return IntrinsicHeight(
      child: Row(
        children: [
          ScheduleRowTimeWidget(configuration: ddd),
          const SizedBox(width: 12),
          Expanded(
            child: ScheduleRowSessionWidget(
              configuration: configuration,
            ),
          ),
        ],
      ),
    );
  }
}

class _ScheduleRowMultiSessionWidget extends ScheduleRowWidget {
  const _ScheduleRowMultiSessionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

enum ScheduleRowWidgetConfigurationProgressStatus {
  oncoming,
  current,
  past,
}
