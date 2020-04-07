import 'dart:convert';
import 'event.dart';
import 'history.dart';
import 'position.dart';
import 'site.dart';

Location locationFromJson(String str) => Location.fromJson(json.decode(str));

String locationToJson(Location data) => json.encode(data.toJson());

class Location {
  String id;
  String name;
  String description;
  Position position;
  String department;
  String type;
  List<Event> events;
  List<History> histories;
  List<Site> sites;

  Location({
    this.id,
    this.name,
    this.description,
    this.position,
    this.department,
    this.type,
    this.events,
    this.histories,
    this.sites,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    position: Position.fromJson(json["position"]),
    department: json["department"],
    type: json["type"],
    events: List<Event>.from(json["events"].map((x) => Event.fromJson(x))),
    histories: List<History>.from(json["histories"].map((x) => History.fromJson(x))),
    sites: List<Site>.from(json["sites"].map((x) => Site.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "position": position.toJson(),
    "department": department,
    "type": type,
    "events": List<dynamic>.from(events.map((x) => x.toJson())),
    "histories": List<dynamic>.from(histories.map((x) => x.toJson())),
    "sites": List<dynamic>.from(sites.map((x) => x.toJson())),
  };
}