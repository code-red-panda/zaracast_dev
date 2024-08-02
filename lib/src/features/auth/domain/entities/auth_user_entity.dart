import 'package:equatable/equatable.dart';

class AuthUserEntity extends Equatable {
  const AuthUserEntity({required this.id, this.name, this.email, this.phone});

  final int id;
  final String? name;
  final String? email;
  final String? phone;

  @override
  List<Object?> get props => [id, name, email, phone];
}
