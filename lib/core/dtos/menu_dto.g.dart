// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MenuDTO _$MenuDTOFromJson(Map<String, dynamic> json) => MenuDTO(
      name: json['name'] as String,
      description: json['description'] as String,
      stock: json['stock'] as int,
      price: (json['price'] as num).toDouble(),
      createdByUserId: MenuDTO._fromJsonDocumentReference(
          json['createdByUserId'] as DocumentReference<Object?>?),
    );

Map<String, dynamic> _$MenuDTOToJson(MenuDTO instance) => <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'stock': instance.stock,
      'price': instance.price,
      'createdByUserId':
          MenuDTO._toJsonDocumentReference(instance.createdByUserId),
    };
