import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'menu_dto.g.dart';

@JsonSerializable()
class MenuDTO{
  final String name;
  final String description;
  final int stock;
  final double price;
  @JsonKey(
    fromJson: _fromJsonDocumentReference,
    toJson: _toJsonDocumentReference,
  )
  final DocumentReference ? createdByUserId;

  MenuDTO({
    required this.name,
    required this.description,
    required this.stock,
    required this.price,
    required this.createdByUserId,
  });

  static DocumentReference? _fromJsonDocumentReference(
      DocumentReference? documentReference) {
    return documentReference;
  }

  static DocumentReference? _toJsonDocumentReference(
      DocumentReference? documentReference) {
    return documentReference;
  }

  factory MenuDTO.fromJson(Map<String, dynamic> json) =>
      _$MenuDTOFromJson(json);

  Map<String, dynamic> toJson() => _$MenuDTOToJson(this);
}