import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_fitness_tracker/ui/cupertino_demo/event.dart';

class EventScreen extends StatefulWidget {
  const EventScreen({Key? key}) : super(key: key);

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  final bool isLoading = false;
  EventType _selectedSegment = EventType.upcoming;

  void _showAlertDialog(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: const Text('Alert'),
        content: const Text('Sign in before event registration'),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('No'),
          ),
          CupertinoDialogAction(
            isDestructiveAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Yes'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: <Widget>[
                  isLoading
                      ? const CupertinoActivityIndicator(
                          radius: 20.0, color: CupertinoColors.activeBlue)
                      : const SizedBox(),
                  CupertinoSlidingSegmentedControl<EventType>(
                    backgroundColor: CupertinoColors.lightBackgroundGray,
                    thumbColor: CupertinoColors.white,
                    groupValue: _selectedSegment,
                    onValueChanged: (EventType? value) {
                      if (value != null) {
                        setState(() {
                          _selectedSegment = value;
                        });
                      }
                    },
                    children: const <EventType, Widget>{
                      EventType.upcoming: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          'Upcoming',
                          style: TextStyle(color: CupertinoColors.black),
                        ),
                      ),
                      EventType.old: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          'History',
                          style: TextStyle(color: CupertinoColors.black),
                        ),
                      ),
                    },
                  ),
                  _selectedSegment.name == "upcoming"
                      ? upcomingEvents(width: width)
                      : oldEvents(width: width)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget upcomingEvents({required double width}) {
    return Expanded(
        child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: newEvents.length,
            itemBuilder: (BuildContext context, int index) {
              Event event = newEvents[index];
              return GestureDetector(
                onTap: () => _showAlertDialog(context),
                child: Card(
                  elevation: 0,
                  margin: const EdgeInsets.only(bottom: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 230,
                        width: width,
                        decoration: BoxDecoration(
                            color: CupertinoColors.white,
                            borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(12.0),
                                topLeft: Radius.circular(12.0)),
                            image: DecorationImage(
                              image: AssetImage(
                                event.img,
                              ),
                              fit: BoxFit.cover,
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 8.0, left: 12.0, right: 12.0, bottom: 4.0),
                        child: Text(
                          event.name,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 8.0, left: 12.0, right: 8.0),
                        child: Text(
                          event.details,
                          style: const TextStyle(fontSize: 16),
                        ),
                      )
                    ],
                  ),
                ),
              );
            }));
  }

  Widget oldEvents({required double width}) {
    return Expanded(
        child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: eventHistory.length,
            itemBuilder: (BuildContext context, int index) {
              Event event = eventHistory[index];
              return GestureDetector(
                onTap: () => _showAlertDialog(context),
                child: Card(
                  elevation: 0,
                  margin: const EdgeInsets.only(bottom: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 230,
                        width: width,
                        decoration: BoxDecoration(
                            color: CupertinoColors.white,
                            borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(12.0),
                                topLeft: Radius.circular(12.0)),
                            image: DecorationImage(
                              image: AssetImage(
                                event.img,
                              ),
                              fit: BoxFit.cover,
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 8.0, left: 12.0, right: 12.0, bottom: 4.0),
                        child: Text(
                          event.name,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 8.0, left: 12.0, right: 8.0),
                        child: Text(
                          event.details,
                          style: const TextStyle(fontSize: 16),
                        ),
                      )
                    ],
                  ),
                ),
              );
            }));
  }
}


