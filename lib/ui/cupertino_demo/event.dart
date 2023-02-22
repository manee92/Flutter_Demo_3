List<Event> newEvents = [
  Event(
      name: "Event Lorem",
      img: "assets/ios-demo/e-1.jpg",
      details: "Lorem ipsum"),
  Event(
      name: "Event Lorem",
      img: "assets/ios-demo/e-2.jpg",
      details: "Lorem ipsum"),
  Event(
      name: "Event Lorem",
      img: "assets/ios-demo/e-1.jpg",
      details: "Lorem ipsum"),
  Event(
      name: "Event Lorem",
      img: "assets/ios-demo/e-2.jpg",
      details: "Lorem ipsum"),
];

List<Event> eventHistory = [
  Event(
      name: "Event Lorem",
      img: "assets/ios-demo/e-2.jpg",
      details: "Lorem ipsum"),
];

class Event {
  String name;
  String img;
  String details;

  Event({required this.name, required this.img, required this.details});
}

enum EventType { upcoming, old }