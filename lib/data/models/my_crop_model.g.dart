// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_crop_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyCropModel _$MyCropModelFromJson(Map<String, dynamic> json) => MyCropModel(
      image: json['image'] as String?,
      myCropModelDynamic: json['myCropModelDynamic'] as bool?,
      legends: (json['legends'] as List<dynamic>?)
          ?.map((e) => Legend.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MyCropModelToJson(MyCropModel instance) =>
    <String, dynamic>{
      'image': instance.image,
      'myCropModelDynamic': instance.myCropModelDynamic,
      'legends': instance.legends,
    };

Legend _$LegendFromJson(Map<String, dynamic> json) => Legend(
      min: (json['min'] as num?)?.toDouble(),
      max: (json['max'] as num?)?.toDouble(),
      hex: json['hex'] as String?,
      label: json['label'] as String?,
      unit: json['unit'] as String?,
      area: (json['area'] as num?)?.toDouble(),
      legendArea: json['area%'] as String?,
    );

Map<String, dynamic> _$LegendToJson(Legend instance) => <String, dynamic>{
      'min': instance.min,
      'max': instance.max,
      'hex': instance.hex,
      'label': instance.label,
      'unit': instance.unit,
      'area': instance.area,
      'area%': instance.legendArea,
    };
