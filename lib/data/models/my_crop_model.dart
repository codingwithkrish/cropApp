import 'package:json_annotation/json_annotation.dart';

part 'my_crop_model.g.dart';

@JsonSerializable()
class MyCropModel {
  MyCropModel({
    required this.image,
    required this.myCropModelDynamic,
    required this.legends,
  });

  final String? image;
  final bool? myCropModelDynamic;
  final List<Legend>? legends;

  MyCropModel copyWith({
    String? image,
    bool? myCropModelDynamic,
    List<Legend>? legends,
  }) {
    return MyCropModel(
      image: image ?? this.image,
      myCropModelDynamic: myCropModelDynamic ?? this.myCropModelDynamic,
      legends: legends ?? this.legends,
    );
  }

  factory MyCropModel.fromJson(Map<String, dynamic> json) => _$MyCropModelFromJson(json);

  Map<String, dynamic> toJson() => _$MyCropModelToJson(this);

  @override
  String toString(){
    return "$image, $myCropModelDynamic, $legends, ";
  }
}

@JsonSerializable()
class Legend {
  Legend({
    required this.min,
    required this.max,
    required this.hex,
    required this.label,
    required this.unit,
    required this.area,
    required this.legendArea,
  });

  final double? min;
  final double? max;
  final String? hex;
  final String? label;
  final String? unit;
  final double? area;

  @JsonKey(name: 'area%')
  final String? legendArea;

  Legend copyWith({
    double? min,
    double? max,
    String? hex,
    String? label,
    String? unit,
    double? area,
    String? legendArea,
  }) {
    return Legend(
      min: min ?? this.min,
      max: max ?? this.max,
      hex: hex ?? this.hex,
      label: label ?? this.label,
      unit: unit ?? this.unit,
      area: area ?? this.area,
      legendArea: legendArea ?? this.legendArea,
    );
  }

  factory Legend.fromJson(Map<String, dynamic> json) => _$LegendFromJson(json);

  Map<String, dynamic> toJson() => _$LegendToJson(this);

  @override
  String toString(){
    return "$min, $max, $hex, $label, $unit, $area, $legendArea, ";
  }
}
