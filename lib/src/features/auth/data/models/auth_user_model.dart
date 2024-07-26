import 'package:json_annotation/json_annotation.dart';
import 'package:zaracast/src/features/auth/domain/entities/auth_user_entity.dart';

part 'auth_user_model.g.dart';

@JsonSerializable()
class AuthUserModel extends AuthUserEntity {
  AuthUserModel({required super.id, super.name, super.email, super.phone});

  factory AuthUserModel.fromJson(Map<String, dynamic> json) =>
      _$AuthUserModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthUserModelToJson(this);
}
