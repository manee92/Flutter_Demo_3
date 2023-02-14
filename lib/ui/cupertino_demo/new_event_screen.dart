import 'package:flutter/cupertino.dart';

class NewEventsScreen extends StatelessWidget {
  const NewEventsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        backgroundColor: CupertinoColors.extraLightBackgroundGray,
        navigationBar: const CupertinoNavigationBar(
          backgroundColor: CupertinoColors.extraLightBackgroundGray,
          border: Border(
            bottom: BorderSide.none,
          ),
          middle: Text('New Event'),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "New Event",
                style: TextStyle(color: CupertinoColors.black),
              ),
              CupertinoContextMenu(
                actions: <Widget>[
                  CupertinoContextMenuAction(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    isDefaultAction: true,
                    trailingIcon: CupertinoIcons.music_note_2,
                    child: const Text('Music'),
                  ),
                  CupertinoContextMenuAction(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    trailingIcon: CupertinoIcons.book,
                    child: const Text('Educational'),
                  ),
                  CupertinoContextMenuAction(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    trailingIcon: CupertinoIcons.arrow_up_doc,
                    child: const Text('Other'),
                  ),
                ],
                child:  const Icon(CupertinoIcons.add_circled, size: 80,),
              ),
            ],
          ),
        ));
  }
}
