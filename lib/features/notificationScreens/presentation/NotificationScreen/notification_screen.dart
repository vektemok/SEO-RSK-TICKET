import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_swipe_action_cell/core/cell.dart';
import 'package:united102/features/notificationScreens/presentation/widgets/left_header_text.dart';

import '../../model/notification_param_model.dart';
import '../../model/notification_queue_model.dart';
import '../widgets/build_notification_widget.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    List<NotificationParam> items =
        List.of(NotificationQueue.notificationQueue);

    List<NotificationParam> newItems =
        List.of(NotificationQueue.notificationActivity);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        elevation: Theme.of(context).appBarTheme.elevation,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 180,
            width: 150,
            child: SvgPicture.asset(
              'assets/appbar_rsk.svg',
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              leftHeaderText('Новые'),
              ListView.builder(
                  itemCount: newItems.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final newItem = newItems[index];
                    return SwipeActionCell(
                        key: ObjectKey(newItems[index]),
                        trailingActions: [
                          SwipeAction(
                              content: Row(
                                children: [
                                  const Text(
                                    'Удалить',
                                    style: TextStyle(
                                      color: Colors.red,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                    width: 10,
                                    child: SvgPicture.asset(
                                        'assets/icons/remove.svg'),
                                  )
                                ],
                              ),
                              onTap: (CompletionHandler handler) async {
                                await handler(true);
                                newItems.removeAt;
                                setState(() {});
                              },
                              color: Colors.white)
                        ],
                        child: BuildNotificationCard(item: newItem, isNew: true, ));
                  }),


              leftHeaderText('Прочитанные'),
              ListView.builder(
                  itemCount: items.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return SwipeActionCell(
                        key: ObjectKey(items[index]),
                        trailingActions: [
                          SwipeAction(
                              content: Row(
                                children: [
                                  const Text(
                                    'Удалить',
                                    style: TextStyle(
                                      color: Colors.red,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                    width: 10,
                                    child: SvgPicture.asset(
                                        'assets/icons/remove.svg'),
                                  )
                                ],
                              ),
                              onTap: (CompletionHandler handler) async {
                                await handler(true);
                                items.removeAt;
                                setState(() {});
                              },
                              color: Colors.white)
                        ],
                        child: BuildNotificationCard(  item: item, isNew: false,  ));
                  }),



            ],
          ),
        ),
      ),
    );
  }
}
