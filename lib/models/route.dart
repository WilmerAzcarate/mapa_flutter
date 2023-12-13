// To parse this JSON data, do
//
//     final route = routeFromJson(jsonString);

import 'dart:convert';

Route routeFromJson(String str) => Route.fromJson(json.decode(str));

String routeToJson(Route data) => json.encode(data.toJson());

class Route {
    String type;
    Metadata metadata;
    List<double> bbox;
    List<Feature> features;

    Route({
        required this.type,
        required this.metadata,
        required this.bbox,
        required this.features,
    });

    factory Route.fromJson(Map<String, dynamic> json) => Route(
        type: json["type"],
        metadata: Metadata.fromJson(json["metadata"]),
        bbox: List<double>.from(json["bbox"].map((x) => x?.toDouble())),
        features: List<Feature>.from(json["features"].map((x) => Feature.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "metadata": metadata.toJson(),
        "bbox": List<dynamic>.from(bbox.map((x) => x)),
        "features": List<dynamic>.from(features.map((x) => x.toJson())),
    };
}

class Feature {
    List<double> bbox;
    String type;
    Properties properties;
    Geometry geometry;

    Feature({
        required this.bbox,
        required this.type,
        required this.properties,
        required this.geometry,
    });

    factory Feature.fromJson(Map<String, dynamic> json) => Feature(
        bbox: List<double>.from(json["bbox"].map((x) => x?.toDouble())),
        type: json["type"],
        properties: Properties.fromJson(json["properties"]),
        geometry: Geometry.fromJson(json["geometry"]),
    );

    Map<String, dynamic> toJson() => {
        "bbox": List<dynamic>.from(bbox.map((x) => x)),
        "type": type,
        "properties": properties.toJson(),
        "geometry": geometry.toJson(),
    };
}

class Geometry {
    List<List<double>> coordinates;
    String type;

    Geometry({
        required this.coordinates,
        required this.type,
    });

    factory Geometry.fromJson(Map<String, dynamic> json) => Geometry(
        coordinates: List<List<double>>.from(json["coordinates"].map((x) => List<double>.from(x.map((x) => x?.toDouble())))),
        type: json["type"],
    );

    Map<String, dynamic> toJson() => {
        "coordinates": List<dynamic>.from(coordinates.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "type": type,
    };
}

class Properties {
    int transfers;
    int fare;
    List<Segment> segments;
    List<int> wayPoints;
    Summary summary;

    Properties({
        required this.transfers,
        required this.fare,
        required this.segments,
        required this.wayPoints,
        required this.summary,
    });

    factory Properties.fromJson(Map<String, dynamic> json) => Properties(
        transfers: json["transfers"],
        fare: json["fare"],
        segments: List<Segment>.from(json["segments"].map((x) => Segment.fromJson(x))),
        wayPoints: List<int>.from(json["way_points"].map((x) => x)),
        summary: Summary.fromJson(json["summary"]),
    );

    Map<String, dynamic> toJson() => {
        "transfers": transfers,
        "fare": fare,
        "segments": List<dynamic>.from(segments.map((x) => x.toJson())),
        "way_points": List<dynamic>.from(wayPoints.map((x) => x)),
        "summary": summary.toJson(),
    };
}

class Segment {
    double distance;
    double duration;
    List<Step> steps;

    Segment({
        required this.distance,
        required this.duration,
        required this.steps,
    });

    factory Segment.fromJson(Map<String, dynamic> json) => Segment(
        distance: json["distance"]?.toDouble(),
        duration: json["duration"]?.toDouble(),
        steps: List<Step>.from(json["steps"].map((x) => Step.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "distance": distance,
        "duration": duration,
        "steps": List<dynamic>.from(steps.map((x) => x.toJson())),
    };
}

class Step {
    double distance;
    double duration;
    int type;
    String instruction;
    String name;
    List<int> wayPoints;

    Step({
        required this.distance,
        required this.duration,
        required this.type,
        required this.instruction,
        required this.name,
        required this.wayPoints,
    });

    factory Step.fromJson(Map<String, dynamic> json) => Step(
        distance: json["distance"]?.toDouble(),
        duration: json["duration"]?.toDouble(),
        type: json["type"],
        instruction: json["instruction"],
        name: json["name"],
        wayPoints: List<int>.from(json["way_points"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "distance": distance,
        "duration": duration,
        "type": type,
        "instruction": instruction,
        "name": name,
        "way_points": List<dynamic>.from(wayPoints.map((x) => x)),
    };
}

class Summary {
    double distance;
    double duration;

    Summary({
        required this.distance,
        required this.duration,
    });

    factory Summary.fromJson(Map<String, dynamic> json) => Summary(
        distance: json["distance"]?.toDouble(),
        duration: json["duration"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "distance": distance,
        "duration": duration,
    };
}

class Metadata {
    String attribution;
    String service;
    int timestamp;
    Query query;
    Engine engine;

    Metadata({
        required this.attribution,
        required this.service,
        required this.timestamp,
        required this.query,
        required this.engine,
    });

    factory Metadata.fromJson(Map<String, dynamic> json) => Metadata(
        attribution: json["attribution"],
        service: json["service"],
        timestamp: json["timestamp"],
        query: Query.fromJson(json["query"]),
        engine: Engine.fromJson(json["engine"]),
    );

    Map<String, dynamic> toJson() => {
        "attribution": attribution,
        "service": service,
        "timestamp": timestamp,
        "query": query.toJson(),
        "engine": engine.toJson(),
    };
}

class Engine {
    String version;
    DateTime buildDate;
    DateTime graphDate;

    Engine({
        required this.version,
        required this.buildDate,
        required this.graphDate,
    });

    factory Engine.fromJson(Map<String, dynamic> json) => Engine(
        version: json["version"],
        buildDate: DateTime.parse(json["build_date"]),
        graphDate: DateTime.parse(json["graph_date"]),
    );

    Map<String, dynamic> toJson() => {
        "version": version,
        "build_date": buildDate.toIso8601String(),
        "graph_date": graphDate.toIso8601String(),
    };
}

class Query {
    List<List<double>> coordinates;
    String profile;
    String format;

    Query({
        required this.coordinates,
        required this.profile,
        required this.format,
    });

    factory Query.fromJson(Map<String, dynamic> json) => Query(
        coordinates: List<List<double>>.from(json["coordinates"].map((x) => List<double>.from(x.map((x) => x?.toDouble())))),
        profile: json["profile"],
        format: json["format"],
    );

    Map<String, dynamic> toJson() => {
        "coordinates": List<dynamic>.from(coordinates.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "profile": profile,
        "format": format,
    };
}
