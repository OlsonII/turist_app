
import 'activity.dart';
import 'position.dart';

class Site {
  String id;
  String name;
  String description;
  Position position;
  String direction;
  String type;
  List<Activity> activities;

  Site({
    this.id,
    this.name,
    this.description,
    this.position,
    this.direction,
    this.type,
    this.activities,
  });

  factory Site.fromJson(Map<String, dynamic> json) => Site(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    position: Position.fromJson(json["position"]),
    direction: json["direction"],
    type: json["type"],
    activities: List<Activity>.from(json["activities"].map((x) => Activity.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "position": position.toJson(),
    "direction": direction,
    "type": type,
    "activities": List<dynamic>.from(activities.map((x) => x.toJson())),
  };
}