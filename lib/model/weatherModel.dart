// To parse this JSON data, do
//
//     final weatherDetailsModel = weatherDetailsModelFromJson(jsonString);

import 'dart:convert';

WeatherDetailsModel weatherDetailsModelFromJson(String str) => WeatherDetailsModel.fromJson(json.decode(str));

String weatherDetailsModelToJson(WeatherDetailsModel data) => json.encode(data.toJson());

class WeatherDetailsModel {
  Location? location;
  Current? current;
  Forecast? forecast;

  WeatherDetailsModel({
    this.location,
    this.current,
    this.forecast,
  });

  factory WeatherDetailsModel.fromJson(Map<String, dynamic> json) => WeatherDetailsModel(
    location: json["location"] == null ? null : Location.fromJson(json["location"]),
    current: json["current"] == null ? null : Current.fromJson(json["current"]),
    forecast: json["forecast"] == null ? null : Forecast.fromJson(json["forecast"]),
  );

  Map<String, dynamic> toJson() => {
    "location": location?.toJson(),
    "current": current?.toJson(),
    "forecast": forecast?.toJson(),
  };
}

class Current {
  int? lastUpdatedEpoch;
  String? lastUpdated;
  double? tempC;
  double? tempF;
  int? isDay;
  Condition? condition;
  double? windMph;
  double? windKph;
  int? windDegree;
  WindDir? windDir;
  int? pressureMb;
  double? pressureIn;
  double? precipMm;
  double? precipIn;
  int? humidity;
  int? cloud;
  double? feelslikeC;
  double? feelslikeF;
  double? windchillC;
  double? windchillF;
  double? heatindexC;
  double? heatindexF;
  double? dewpointC;
  double? dewpointF;
  int? visKm;
  int? visMiles;
  int? uv;
  double? gustMph;
  double? gustKph;
  int? timeEpoch;
  String? time;
  int? snowCm;
  int? willItRain;
  int? chanceOfRain;
  int? willItSnow;
  int? chanceOfSnow;

  Current({
    this.lastUpdatedEpoch,
    this.lastUpdated,
    this.tempC,
    this.tempF,
    this.isDay,
    this.condition,
    this.windMph,
    this.windKph,
    this.windDegree,
    this.windDir,
    this.pressureMb,
    this.pressureIn,
    this.precipMm,
    this.precipIn,
    this.humidity,
    this.cloud,
    this.feelslikeC,
    this.feelslikeF,
    this.windchillC,
    this.windchillF,
    this.heatindexC,
    this.heatindexF,
    this.dewpointC,
    this.dewpointF,
    this.visKm,
    this.visMiles,
    this.uv,
    this.gustMph,
    this.gustKph,
    this.timeEpoch,
    this.time,
    this.snowCm,
    this.willItRain,
    this.chanceOfRain,
    this.willItSnow,
    this.chanceOfSnow,
  });

  factory Current.fromJson(Map<String, dynamic> json) => Current(
    lastUpdatedEpoch: json["last_updated_epoch"],
    lastUpdated: json["last_updated"],
    tempC: json["temp_c"]?.toDouble(),
    tempF: json["temp_f"]?.toDouble(),
    isDay: json["is_day"],
    condition: json["condition"] == null ? null : Condition.fromJson(json["condition"]),
    windMph: json["wind_mph"]?.toDouble(),
    windKph: json["wind_kph"]?.toDouble(),
    windDegree: json["wind_degree"],
    windDir: windDirValues.map[json["wind_dir"]]!,
    pressureMb: json["pressure_mb"],
    pressureIn: json["pressure_in"]?.toDouble(),
    precipMm: json["precip_mm"]?.toDouble(),
    precipIn: json["precip_in"]?.toDouble(),
    humidity: json["humidity"],
    cloud: json["cloud"],
    feelslikeC: json["feelslike_c"]?.toDouble(),
    feelslikeF: json["feelslike_f"]?.toDouble(),
    windchillC: json["windchill_c"]?.toDouble(),
    windchillF: json["windchill_f"]?.toDouble(),
    heatindexC: json["heatindex_c"]?.toDouble(),
    heatindexF: json["heatindex_f"]?.toDouble(),
    dewpointC: json["dewpoint_c"]?.toDouble(),
    dewpointF: json["dewpoint_f"]?.toDouble(),
    visKm: json["vis_km"],
    visMiles: json["vis_miles"],
    uv: json["uv"],
    gustMph: json["gust_mph"]?.toDouble(),
    gustKph: json["gust_kph"]?.toDouble(),
    timeEpoch: json["time_epoch"],
    time: json["time"],
    snowCm: json["snow_cm"],
    willItRain: json["will_it_rain"],
    chanceOfRain: json["chance_of_rain"],
    willItSnow: json["will_it_snow"],
    chanceOfSnow: json["chance_of_snow"],
  );

  Map<String, dynamic> toJson() => {
    "last_updated_epoch": lastUpdatedEpoch,
    "last_updated": lastUpdated,
    "temp_c": tempC,
    "temp_f": tempF,
    "is_day": isDay,
    "condition": condition?.toJson(),
    "wind_mph": windMph,
    "wind_kph": windKph,
    "wind_degree": windDegree,
    "wind_dir": windDirValues.reverse[windDir],
    "pressure_mb": pressureMb,
    "pressure_in": pressureIn,
    "precip_mm": precipMm,
    "precip_in": precipIn,
    "humidity": humidity,
    "cloud": cloud,
    "feelslike_c": feelslikeC,
    "feelslike_f": feelslikeF,
    "windchill_c": windchillC,
    "windchill_f": windchillF,
    "heatindex_c": heatindexC,
    "heatindex_f": heatindexF,
    "dewpoint_c": dewpointC,
    "dewpoint_f": dewpointF,
    "vis_km": visKm,
    "vis_miles": visMiles,
    "uv": uv,
    "gust_mph": gustMph,
    "gust_kph": gustKph,
    "time_epoch": timeEpoch,
    "time": time,
    "snow_cm": snowCm,
    "will_it_rain": willItRain,
    "chance_of_rain": chanceOfRain,
    "will_it_snow": willItSnow,
    "chance_of_snow": chanceOfSnow,
  };
}

class Condition {
  Text1? text;
  String? icon;
  int? code;

  Condition({
    this.text,
    this.icon,
    this.code,
  });

  factory Condition.fromJson(Map<String, dynamic> json) => Condition(
    text: textValues.map[json["text"]]!,
    icon: json["icon"],
    code: json["code"],
  );

  Map<String, dynamic> toJson() => {
    "text": textValues.reverse[text],
    "icon": icon,
    "code": code,
  };
}

enum Text1 {
  CLOUDY,
  PARTLY_CLOUDY,
  PATCHY_RAIN_NEARBY,
  THUNDERY_OUTBREAKS_IN_NEARBY
}

final textValues = EnumValues({
  "Cloudy ": Text1.CLOUDY,
  "Partly Cloudy ": Text1.PARTLY_CLOUDY,
  "Patchy rain nearby": Text1.PATCHY_RAIN_NEARBY,
  "Thundery outbreaks in nearby": Text1.THUNDERY_OUTBREAKS_IN_NEARBY
});

enum WindDir {
  S,
  SSW,
  SW
}

final windDirValues = EnumValues({
  "S": WindDir.S,
  "SSW": WindDir.SSW,
  "SW": WindDir.SW
});

class Forecast {
  List<Forecastday>? forecastday;

  Forecast({
    this.forecastday,
  });

  factory Forecast.fromJson(Map<String, dynamic> json) => Forecast(
    forecastday: json["forecastday"] == null ? [] : List<Forecastday>.from(json["forecastday"]!.map((x) => Forecastday.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "forecastday": forecastday == null ? [] : List<dynamic>.from(forecastday!.map((x) => x.toJson())),
  };
}

class Forecastday {
  DateTime? date;
  int? dateEpoch;
  Day? day;
  Astro? astro;
  List<Current>? hour;

  Forecastday({
    this.date,
    this.dateEpoch,
    this.day,
    this.astro,
    this.hour,
  });

  factory Forecastday.fromJson(Map<String, dynamic> json) => Forecastday(
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    dateEpoch: json["date_epoch"],
    day: json["day"] == null ? null : Day.fromJson(json["day"]),
    astro: json["astro"] == null ? null : Astro.fromJson(json["astro"]),
    hour: json["hour"] == null ? [] : List<Current>.from(json["hour"]!.map((x) => Current.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "date": "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
    "date_epoch": dateEpoch,
    "day": day?.toJson(),
    "astro": astro?.toJson(),
    "hour": hour == null ? [] : List<dynamic>.from(hour!.map((x) => x.toJson())),
  };
}

class Astro {
  String? sunrise;
  String? sunset;
  String? moonrise;
  String? moonset;
  String? moonPhase;
  int? moonIllumination;
  int? isMoonUp;
  int? isSunUp;

  Astro({
    this.sunrise,
    this.sunset,
    this.moonrise,
    this.moonset,
    this.moonPhase,
    this.moonIllumination,
    this.isMoonUp,
    this.isSunUp,
  });

  factory Astro.fromJson(Map<String, dynamic> json) => Astro(
    sunrise: json["sunrise"],
    sunset: json["sunset"],
    moonrise: json["moonrise"],
    moonset: json["moonset"],
    moonPhase: json["moon_phase"],
    moonIllumination: json["moon_illumination"],
    isMoonUp: json["is_moon_up"],
    isSunUp: json["is_sun_up"],
  );

  Map<String, dynamic> toJson() => {
    "sunrise": sunrise,
    "sunset": sunset,
    "moonrise": moonrise,
    "moonset": moonset,
    "moon_phase": moonPhase,
    "moon_illumination": moonIllumination,
    "is_moon_up": isMoonUp,
    "is_sun_up": isSunUp,
  };
}

class Day {
  double? maxtempC;
  double? maxtempF;
  double? mintempC;
  double? mintempF;
  double? avgtempC;
  double? avgtempF;
  double? maxwindMph;
  double? maxwindKph;
  double? totalprecipMm;
  double? totalprecipIn;
  int? totalsnowCm;
  int? avgvisKm;
  int? avgvisMiles;
  int? avghumidity;
  int? dailyWillItRain;
  int? dailyChanceOfRain;
  int? dailyWillItSnow;
  int? dailyChanceOfSnow;
  Condition? condition;
  int? uv;

  Day({
    this.maxtempC,
    this.maxtempF,
    this.mintempC,
    this.mintempF,
    this.avgtempC,
    this.avgtempF,
    this.maxwindMph,
    this.maxwindKph,
    this.totalprecipMm,
    this.totalprecipIn,
    this.totalsnowCm,
    this.avgvisKm,
    this.avgvisMiles,
    this.avghumidity,
    this.dailyWillItRain,
    this.dailyChanceOfRain,
    this.dailyWillItSnow,
    this.dailyChanceOfSnow,
    this.condition,
    this.uv,
  });

  factory Day.fromJson(Map<String, dynamic> json) => Day(
    maxtempC: json["maxtemp_c"]?.toDouble(),
    maxtempF: json["maxtemp_f"]?.toDouble(),
    mintempC: json["mintemp_c"]?.toDouble(),
    mintempF: json["mintemp_f"]?.toDouble(),
    avgtempC: json["avgtemp_c"]?.toDouble(),
    avgtempF: json["avgtemp_f"]?.toDouble(),
    maxwindMph: json["maxwind_mph"]?.toDouble(),
    maxwindKph: json["maxwind_kph"]?.toDouble(),
    totalprecipMm: json["totalprecip_mm"]?.toDouble(),
    totalprecipIn: json["totalprecip_in"]?.toDouble(),
    totalsnowCm: json["totalsnow_cm"],
    avgvisKm: json["avgvis_km"],
    avgvisMiles: json["avgvis_miles"],
    avghumidity: json["avghumidity"],
    dailyWillItRain: json["daily_will_it_rain"],
    dailyChanceOfRain: json["daily_chance_of_rain"],
    dailyWillItSnow: json["daily_will_it_snow"],
    dailyChanceOfSnow: json["daily_chance_of_snow"],
    condition: json["condition"] == null ? null : Condition.fromJson(json["condition"]),
    uv: json["uv"],
  );

  Map<String, dynamic> toJson() => {
    "maxtemp_c": maxtempC,
    "maxtemp_f": maxtempF,
    "mintemp_c": mintempC,
    "mintemp_f": mintempF,
    "avgtemp_c": avgtempC,
    "avgtemp_f": avgtempF,
    "maxwind_mph": maxwindMph,
    "maxwind_kph": maxwindKph,
    "totalprecip_mm": totalprecipMm,
    "totalprecip_in": totalprecipIn,
    "totalsnow_cm": totalsnowCm,
    "avgvis_km": avgvisKm,
    "avgvis_miles": avgvisMiles,
    "avghumidity": avghumidity,
    "daily_will_it_rain": dailyWillItRain,
    "daily_chance_of_rain": dailyChanceOfRain,
    "daily_will_it_snow": dailyWillItSnow,
    "daily_chance_of_snow": dailyChanceOfSnow,
    "condition": condition?.toJson(),
    "uv": uv,
  };
}

class Location {
  String? name;
  String? region;
  String? country;
  double? lat;
  double? lon;
  String? tzId;
  int? localtimeEpoch;
  String? localtime;

  Location({
    this.name,
    this.region,
    this.country,
    this.lat,
    this.lon,
    this.tzId,
    this.localtimeEpoch,
    this.localtime,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    name: json["name"],
    region: json["region"],
    country: json["country"],
    lat: json["lat"]?.toDouble(),
    lon: json["lon"]?.toDouble(),
    tzId: json["tz_id"],
    localtimeEpoch: json["localtime_epoch"],
    localtime: json["localtime"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "region": region,
    "country": country,
    "lat": lat,
    "lon": lon,
    "tz_id": tzId,
    "localtime_epoch": localtimeEpoch,
    "localtime": localtime,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}