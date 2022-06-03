
import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String id;
  final String? email;
  final String? name;

  const UserModel({required this.id, this.email, this.name});

  @override
  // TODO: implement props
  List<Object?> get props => [id, email, name];

}