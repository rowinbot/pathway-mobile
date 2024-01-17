// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_object.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CardObjectImpl _$$CardObjectImplFromJson(Map<String, dynamic> json) =>
    _$CardObjectImpl(
      id: json['id'] as String,
      uid: json['uid'] as String,
      kind: json['kind'] as String,
      number: json['number'] as String,
      color: json['color'] as String,
    );

Map<String, dynamic> _$$CardObjectImplToJson(_$CardObjectImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'kind': instance.kind,
      'number': instance.number,
      'color': instance.color,
    };
