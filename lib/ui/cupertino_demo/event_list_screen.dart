import 'package:flutter/cupertino.dart';
import 'package:my_fitness_tracker/ui/cupertino_demo/event.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.extraLightBackgroundGray,
      navigationBar: const CupertinoNavigationBar(
        backgroundColor: CupertinoColors.extraLightBackgroundGray,
        border: Border(
          bottom: BorderSide.none,
        ),
        middle: Text('Events'),
      ),
      child: CupertinoListSection.insetGrouped(
        children: newEvents.map((e) {
          return CupertinoListTile.notched(
              title:  Text(e.name, style: const TextStyle(color: CupertinoColors.label, fontSize: 18),),
              leading: Image.asset(
                e.img,
                height: 30,
                fit: BoxFit.cover,
              ),
              trailing: const CupertinoListTileChevron(),
              onTap: () {});
        }).toList(),
      ),
    );
  }
}
