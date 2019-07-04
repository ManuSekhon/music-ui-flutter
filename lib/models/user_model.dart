import 'package:scoped_model/scoped_model.dart';

/// Model representing current logged in user
class UserModel extends Model {
  int _id;
  String _fullName;
  String _username;
  String _email;
  String _phone;
  String _website;
  Address _address;
  Company _company;

  void createUser(Map<String, dynamic> user) {
    this._id = user['id'];
    this._fullName = user['name'];
    this._username = user['username'];
    this._email = user['email'];
    this._phone = user['phone'];
    this._website = user['website'];
    this._address = Address.fromJson(user['address']);
    this._company = Company.fromJson(user['company']);
  }

  // getters
  int get id => this._id;
  String get name => this._fullName;
  String get username => this._username;
  String get email => this._email;
  String get phone => this._phone;
  String get website => this._website;
  Address get address => this._address;
  Company get company => this._company;
}

/// Model representing address of user
class Address {
  String street;
  String suite;
  String city;
  String zipcode;
  Geo geo;

  Address({this.street, this.suite, this.city, this.zipcode, this.geo});

  factory Address.fromJson(Map<String, dynamic> address) {
    return Address(
      street: address['street'],
      suite: address['suite'],
      city: address['city'],
      zipcode: address['zipcode'],
      geo: Geo.fromJson(address['geo']),
    );
  }
}

/// Model representing lat - long for user address
class Geo {
  String lat;
  String long;

  Geo({this.lat, this.long});

  factory Geo.fromJson(Map<String, dynamic> geoDetails) {
    return Geo(
      lat: geoDetails['lat'],
      long: geoDetails['long'],
    );
  }
}

/// Model representing company details of user
class Company {
  String name;
  String catchPhrase;
  String bs;

  Company({this.name, this.catchPhrase, this.bs});

  factory Company.fromJson(Map<String, dynamic> companyDetails) {
    return Company(
      name: companyDetails['name'],
      catchPhrase: companyDetails['catchPhrase'],
      bs: companyDetails['bs'],
    );
  }
}
