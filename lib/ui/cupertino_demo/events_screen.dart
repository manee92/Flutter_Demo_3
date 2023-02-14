import 'package:flutter/cupertino.dart';

class EventsScreen extends StatelessWidget {
  const EventsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.extraLightBackgroundGray,
      child: CustomScrollView(
        slivers: <Widget>[
          const CupertinoSliverNavigationBar(
              backgroundColor: CupertinoColors.extraLightBackgroundGray,
              border: Border(
                bottom: BorderSide.none,
              ),
              largeTitle: Text('Events'),
          ),
          SliverFillRemaining(
            child: Column(
              children: <Widget>[
                Text("New Event")

              ],
            ),
          ),
        ],
      ),

    );
  }
}
