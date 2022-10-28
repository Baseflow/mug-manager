import '../../../core/models/mug.dart';

class HttpMug extends Mug {
  HttpMug.fromMug(Mug mug)
      : super(
          id: mug.id,
          firstName: mug.firstName,
          lastName: mug.lastName,
          nickName: mug.nickName,
          isBroken: mug.isBroken,
        );

  HttpMug.fromJson(Map<String, dynamic> json)
      : super(
          id: json['id'],
          firstName: json['first_name'],
          lastName: json['last_name'],
          nickName: json['nickname'],
          isBroken: json['is_broken'],
        );

  Map<String, dynamic> toJson() => {
        'id': id,
        'first_name': firstName,
        'last_name': lastName,
        'nickname': nickName,
        'is_broken': isBroken,
      };
}
