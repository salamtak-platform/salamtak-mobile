import 'address.dart';

class UserModel {
  String? id;
  String? phone;
  List<dynamic>? coverImage;
  bool? isRegistrationComplete;
  bool? isEmailVerified;
  bool? isPhoneVerified;
  dynamic deletedAt;
  String? role;
  List<Address>? addresses;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  DateTime? dateOfBirth;
  String? firstName;
  String? lastName;
  String? password;
  String? profileImage;

  UserModel({
    this.id,
    this.phone,
    this.coverImage,
    this.isRegistrationComplete,
    this.isEmailVerified,
    this.isPhoneVerified,
    this.deletedAt,
    this.role,
    this.addresses,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.dateOfBirth,
    this.firstName,
    this.lastName,
    this.password,
    this.profileImage,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['_id'] as String?,
        phone: json['phone'] as String?,
        coverImage: json['coverImage'] as List<dynamic>?,
        isRegistrationComplete: json['isRegistrationComplete'] as bool?,
        isEmailVerified: json['isEmailVerified'] as bool?,
        isPhoneVerified: json['isPhoneVerified'] as bool?,
        deletedAt: json['deletedAt'] as dynamic,
        role: json['role'] as String?,
        addresses: (json['addresses'] as List<dynamic>?)
            ?.map((e) => Address.fromJson(e as Map<String, dynamic>))
            .toList(),
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
        v: json['__v'] as int?,
        dateOfBirth: json['dateOfBirth'] == null
            ? null
            : DateTime.parse(json['dateOfBirth'] as String),
        firstName: json['firstName'] as String?,
        lastName: json['lastName'] as String?,
        password: json['password'] as String?,
        profileImage: json['profileImage'] as String?,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'phone': phone,
        'coverImage': coverImage,
        'isRegistrationComplete': isRegistrationComplete,
        'isEmailVerified': isEmailVerified,
        'isPhoneVerified': isPhoneVerified,
        'deletedAt': deletedAt,
        'role': role,
        'addresses': addresses?.map((e) => e.toJson()).toList(),
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        '__v': v,
        'dateOfBirth': dateOfBirth?.toIso8601String(),
        'firstName': firstName,
        'lastName': lastName,
        'password': password,
        'profileImage': profileImage,
      };
}
