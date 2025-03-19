

// ignore_for_file: file_names

class SetCustomDataInObjectJson {
  String addInfoType;
  String tagName;
  String tagValue;

  SetCustomDataInObjectJson({
    required this.addInfoType,
    required this.tagName,
    required this.tagValue,
  });

  factory SetCustomDataInObjectJson.fromJson(Map<String, dynamic> json) {
    return SetCustomDataInObjectJson(
      addInfoType: json['addInfoType'],
      tagName: json['tagName'],
      tagValue: json['tagValue'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'addInfoType': addInfoType,
      'tagName': tagName,
      'tagValue': tagValue,
    };
  }
}
