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
    final configuration = ScheduleRowSessionWidgetConfiguration(
      avatarUrl:
          'https://www.meme-arsenal.com/memes/54f17b77ced3591bebe54c4f1cb32967.jpg',
      speakerName: 'Алексей Чулпин',
      sessionTitle: 'Субъективность в оценке дизайна',
      isFavorite: false,
      progressStatus: ScheduleRowWidgetConfigurationProgressStatus.oncoming,
    );
    return CustomMultiChildLayout(
      delegate: RowLayoutDelegate(),
      children: [
        LayoutId(
          id: 1,
          child: const ScheduleRowTimeWidget(),
        ),
        LayoutId(
          id: 2,
          child: Expanded(
            child: ScheduleRowSessionWidget(
              configuration: configuration,
            ),
          ),
        ),
      ],
    );
  }
}

class RowLayoutDelegate extends MultiChildLayoutDelegate {

  @override
  Size getSize(BoxConstraints constraints) {
    final size = super.getSize(constraints);
    return size;
  }

  @override
  void performLayout(Size size) {
    const firstChildWidth = 48.0;
    const spaceChildWidth = 12.0;
    const secondChildXOffset = firstChildWidth +  spaceChildWidth;
    var secondChildSize = Size.zero;
    if (hasChild(2)) {
      final maxWidth = size.width - secondChildXOffset;
      secondChildSize = layoutChild(2, BoxConstraints(maxWidth: maxWidth));
    }
    if (hasChild(1)) {
      final maxHeight = max(secondChildSize.height, 90.0);
      layoutChild(1, BoxConstraints(maxWidth: firstChildWidth, maxHeight: maxHeight));
    }

    positionChild(1, Offset.zero);
    positionChild(2, const Offset(secondChildXOffset,0.0));
  }

  @override
  bool shouldRelayout(covariant MultiChildLayoutDelegate oldDelegate) {
    return false;
  }
}

// @override
// void performLayout(Size size) {
//   // `size` is the size of the `CustomMultiChildLayout` itself.
//
//   Size leadingSize = Size.zero; // If there is no widget with id `1`, the size will remain at zero.
//   // Remember that `1` here can be any **id** - you specify them using LayoutId.
//   if (hasChild(1)) {
//     leadingSize = layoutChild(
//       1, // The id once again.
//       BoxConstraints.loose(size), // This just says that the child cannot be bigger than the whole layout.
//     );
//     // No need to position this child if we want to have it at Offset(0, 0).
//   }
//
//   if (hasChild(2)) {
//     final secondSize = layoutChild(
//       2,
//       BoxConstraints(
//         // This is exactly the same as above, but this can be anything you specify.
//         // BoxConstraints.loose is a shortcut to this.
//         maxWidth: size.width,
//         maxHeight: size.height,
//       ),
//     );
//
//     positionChild(
//       2,
//       Offset(
//         leadingSize.width, // This will place child 2 to the right of child 1.
//         size.height / 2 - secondSize.height / 2, // Centers the second child vertically.
//       ),
//     );
//   }
// }

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
