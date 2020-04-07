
import 'position.dart';

class Event {
  String id;
  String name;
  String description;
  Position position;
  String initialDate;
  String endDate;
  String initialHour;
  String endHour;

  Event({
    this.id,
    this.name,
    this.description,
    this.position,
    this.initialDate,
    this.endDate,
    this.initialHour,
    this.endHour,
  });

  factory Event.fromJson(Map<String, dynamic> json) => Event(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    position: Position.fromJson(json["position"]),
    initialDate: json["initialDate"],
    endDate: json["endDate"],
    initialHour: json["initialHour"],
    endHour: json["endHour"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "position": position.toJson(),
    "initialDate": initialDate,
    "endDate": endDate,
    "initialHour": initialHour,
    "endHour": endHour,
  };
}