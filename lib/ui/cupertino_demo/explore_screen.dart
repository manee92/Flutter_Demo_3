import 'package:flutter/cupertino.dart';
import 'package:my_fitness_tracker/ui/cupertino_demo/event_list_screen.dart';

const List<String> eventCategories = <String>[
  'Near me',
  'Online',
];

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  DateTime date = DateTime(2023, 03, 15);
  DateTime time = DateTime(2023, 5, 10, 22, 35);
  DateTime dateTime = DateTime(2023, 5, 3, 17, 45);
  TextStyle subTitleStyle =
      const TextStyle(color: CupertinoColors.label, fontSize: 18);
  int _selectedCat = 0;
  bool switchValue = true;

  void _showPicker({required Widget child}) {
    showCupertinoModalPopup<void>(
        context: context,
        builder: (BuildContext context) => Container(
              height: 216,
              padding: const EdgeInsets.only(top: 6.0),
              margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              color: CupertinoColors.systemBackground.resolveFrom(context),
              child: SafeArea(
                top: false,
                child: child,
              ),
            ));
  }

  void _showDialog({required Widget child, required BuildContext context}) {
    showCupertinoModalPopup<void>(
        context: context,
        builder: (BuildContext context) => Container(
              height: 216,
              padding: const EdgeInsets.only(top: 6.0),
              margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              color: CupertinoColors.systemBackground.resolveFrom(context),
              child: SafeArea(
                top: false,
                child: child,
              ),
            ));
  }

  void _showActionSheet(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        title: const Text(
          'Remember filters',
          style: TextStyle(fontSize: 20),
        ),
        message: const Text('Save selected filters'),
        actions: <CupertinoActionSheetAction>[
          CupertinoActionSheetAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.of(context).push(
                CupertinoPageRoute<void>(
                  builder: (BuildContext context) => const SearchResult(),
                ),
              );
            },
            child: const Text('Save filters'),
          ),
          CupertinoActionSheetAction(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Edit'),
          ),
          CupertinoActionSheetAction(
            isDestructiveAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }

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
            largeTitle: Text('Explore'),
          ),
          SliverFillRemaining(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Notify me on new events',
                                style: subTitleStyle),
                            CupertinoSwitch(
                              value: switchValue,
                              activeColor: CupertinoColors.activeBlue,
                              onChanged: (bool? value) {
                                setState(() {
                                  switchValue = value ?? false;
                                });
                              },
                            ),
                          ]),
                    ),
                    _PickerItemRow(
                      children: <Widget>[
                        Text('Date', style: subTitleStyle),
                        CupertinoButton(
                          onPressed: () => _showDialog(
                              child: CupertinoDatePicker(
                                initialDateTime: date,
                                mode: CupertinoDatePickerMode.date,
                                use24hFormat: true,
                                onDateTimeChanged: (DateTime newDate) {
                                  setState(() => date = newDate);
                                },
                              ),
                              context: context),
                          child: Text(
                            '${date.month}-${date.day}-${date.year}',
                            style: const TextStyle(
                              fontSize: 22.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                    _PickerItemRow(
                      children: <Widget>[
                        Text('Time', style: subTitleStyle),
                        CupertinoButton(
                          onPressed: () => _showDialog(
                              child: CupertinoDatePicker(
                                initialDateTime: time,
                                mode: CupertinoDatePickerMode.time,
                                use24hFormat: true,
                                onDateTimeChanged: (DateTime newTime) {
                                  setState(() => time = newTime);
                                },
                              ),
                              context: context),
                          child: Text(
                            '${time.hour}:${time.minute}',
                            style: const TextStyle(
                              fontSize: 22.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                    _PickerItemRow(
                      children: <Widget>[
                        Text('DateTime', style: subTitleStyle),
                        CupertinoButton(
                          onPressed: () => _showDialog(
                              child: CupertinoDatePicker(
                                initialDateTime: dateTime,
                                use24hFormat: true,
                                onDateTimeChanged: (DateTime newDateTime) {
                                  setState(() => dateTime = newDateTime);
                                },
                              ),
                              context: context),
                          child: Text(
                            '${dateTime.month}-${dateTime.day}-${dateTime.year} ${dateTime.hour}:${dateTime.minute}',
                            style: const TextStyle(
                              fontSize: 22.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                    _PickerItemRow(
                      children: <Widget>[
                        Text('Category', style: subTitleStyle),
                        CupertinoButton(
                          onPressed: () => _showPicker(
                            child: CupertinoPicker(
                              magnification: 1.22,
                              squeeze: 1.2,
                              useMagnifier: true,
                              itemExtent: 32.0,
                              onSelectedItemChanged: (int selectedItem) {
                                setState(() {
                                  _selectedCat = selectedItem;
                                });
                              },
                              children: List<Widget>.generate(
                                  eventCategories.length, (int index) {
                                return Center(
                                  child: Text(
                                    eventCategories[index],
                                  ),
                                );
                              }),
                            ),
                          ),
                          child: Text(
                            eventCategories[_selectedCat],
                            style: const TextStyle(
                              fontSize: 22.0,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: CupertinoButton(
                    color: CupertinoColors.activeBlue,
                    onPressed: () => _showActionSheet(context),
                    child: const Text(
                      'Search events',
                      style: TextStyle(
                        fontSize: 22.0,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _PickerItemRow extends StatelessWidget {
  const _PickerItemRow({required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: CupertinoColors.inactiveGray,
            width: 0.0,
          ),
          bottom: BorderSide(
            color: CupertinoColors.inactiveGray,
            width: 0.0,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: children,
        ),
      ),
    );
  }
}
