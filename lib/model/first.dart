
import 'dart:convert';

List<Firstpagedata> firstpagedataFromJson(String str) => List<Firstpagedata>.from(json.decode(str).map((x) => Firstpagedata.fromJson(x)));

String firstpagedataToJson(List<Firstpagedata> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Firstpagedata {
    Firstpagedata({
       required this.domains,
       required this.alphaTwoCode,
       required this.country,
       required this.webPages,
       required this.name,
       required this.stateProvince,
    });

    List<String> domains;
    AlphaTwoCode? alphaTwoCode;
    Country? country;
    List<String> webPages;
    String name;
    String stateProvince;

    factory Firstpagedata.fromJson(Map<String, dynamic> json) => Firstpagedata(
        domains: List<String>.from(json["domains"].map((x) => x)),
        alphaTwoCode: alphaTwoCodeValues.map[json["alpha_two_code"]],
        country: countryValues.map[json["country"]],
        webPages: List<String>.from(json["web_pages"].map((x) => x)),
        name: json["name"],
        stateProvince: json["state-province"] == null ? null : json["state-province"],
    );

    Map<String, dynamic> toJson() => {
        "domains": List<dynamic>.from(domains.map((x) => x)),
        "alpha_two_code": alphaTwoCodeValues.reverse[alphaTwoCode],
        "country": countryValues.reverse[country],
        "web_pages": List<dynamic>.from(webPages.map((x) => x)),
        "name": name,
        "state-province": stateProvince == null ? null : stateProvince,
    };
}

enum AlphaTwoCode { US }

final alphaTwoCodeValues = EnumValues({
    "US": AlphaTwoCode.US
});

enum Country { UNITED_STATES }

final countryValues = EnumValues({
    "United States": Country.UNITED_STATES
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
