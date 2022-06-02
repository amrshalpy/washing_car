import 'package:flutter/material.dart';

class Washing {
  int? _id;
  String? _date;
  String? _carNumber;
  String? _carSize;
  String? _carKind;
  String? _washingServices;
  String? _count;

  String? _totalPrice;
  String? _discount;

  Washing(
    this._carKind,
    this._carNumber,
    this._carSize,
    this._count,
    this._date,
    this._discount,
    this._id,
    this._totalPrice,
    this._washingServices,
  );
  Washing.map(dynamic obj) {
    _carKind = obj['carKind'];
    _carNumber = obj['carNumber'];
    _carSize = obj['carSize'];
    _count = obj['count'];
    _date = obj['date'];
    _discount = obj['discount'];
    _id = obj['id'];
    _totalPrice = obj['totalPrice'];
    _washingServices = obj['washingServices'];
  }

  Washing.fromJson(Map<String, dynamic> json) {
    _carKind = json['carKind'];
    _carNumber = json['carNumber'];
    _carSize = json['carSize'];
    _count = json['count'];
    _date = json['date'];
    _discount = json['discount'];
    _id = json['id'];
    _totalPrice = json['totalPrice'];
    _washingServices = json['washingServices'];
  }
  Map<String, dynamic> toMap() {
    return {
      'carNumber': carNumber,
      'carSize': carSize,
      'count': count,
      'date': date,
      'discount': discount,
      'id': id,
      'totalPrice': totalPrice,
      'washingServices': washingServices,
      'carKind': carKind,
    };
  }

  String? get date => _date;
  int? get id => _id;

  String? get carNumber => _carNumber;

  String? get carSize => _carSize;

  String? get carKind => _carKind;

  String? get washingServices => _washingServices;

  String? get count => _count;

  String? get totalPrice => _totalPrice;

  String? get discount => _discount;
}

// amrshalpy