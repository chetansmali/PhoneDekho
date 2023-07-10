import 'dart:convert';

class User {
  final String id;
  final String name;
  final String email;
  final String password;
  final String address;
  final String type;
  final String token;

  User(
      {required this.id,
        required this.name,
        required this.email,
        required this.password,
        required this.address,
        required this.type,
        required this.token});

  Map<String,dynamic> toMap(){
    return{
      'id' : id,
      'name' : name,
      'email' : email,
      'password' : password,
      'address' : address,
      'type' : type,
      'token' : token,
    };
  }

  factory User.fromMap(Map<String,dynamic> map){
    return User(
      id : map['_id'] ?? '',
      name:map['name'] ?? '',
      password: map['password'] ?? '',
      email: map['email'] ?? '',
      token: map['token'] ??'',
      address: map['address'] ?? '',
      type: map['type'] ?? '',
    );
  }

  //user object to JSON (encode)
  String toJson() => json.encode(toMap());

  //JSON to user object (decode)
  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}






//
// factory User.fromJson(Map<String, dynamic> json) => User(
// name: json["name"],
// password: json["password"],
// email: json["email"],
// address: json["address"],
// type: json["type"],
// id: json["_id"],
// token: json["token"],
// );
//
// Map<String, dynamic> toJson() => {
// "name": name,
// "email" : email,
// "password": password,
// "address": address,
// "type": type,
// "_id": id,
// "token" :token,
// };
//
// User userFromJson(String str) => User.fromJson(json.decode(str));
//
// String userToJson(User data) => json.encode(data.toJson());
