class Address {
  String? name;
  String? flatNumber;
  String? floor;
  String? buildingNumber;
  String? street;
  String? city;
  String? government;
  String? id;

  Address({
    this.name,
    this.flatNumber,
    this.floor,
    this.buildingNumber,
    this.street,
    this.city,
    this.government,
    this.id,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        name: json['name'] as String?,
        flatNumber: json['flatNumber'] as String?,
        floor: json['floor'] as String?,
        buildingNumber: json['buildingNumber'] as String?,
        street: json['street'] as String?,
        city: json['city'] as String?,
        government: json['government'] as String?,
        id: json['_id'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'flatNumber': flatNumber,
        'floor': floor,
        'buildingNumber': buildingNumber,
        'street': street,
        'city': city,
        'government': government,
        '_id': id,
      };
}
