import 'package:meta/meta.dart';
import 'dart:convert';

part 'client_types.dart';
part 'abi_types.dart';
part 'boc_types.dart';
part 'crypto_types.dart';
part 'utils_types.dart';
part 'processing_types.dart';
part 'tvm_types.dart';
part 'net_types.dart';

abstract class TonSdkStructure {
  Map<String, dynamic> toMap();
  @override
  String toString() {
    final map = toMap();
    var res = '{';
    map.forEach((key, val) {
      if (val != null) {
        if (res.length > 1) res += ',';
        if (val is String) {
          res += '"$key":"$val"';
        } else if (val is Map) {
          res += '"$key":${jsonEncode(val)}';
        } else if (val is List) {
          res += '"$key":[';
          for (var i = 0; i < val.length; i++) {
            if (i > 0) {
              res += ',';
            }
            res += _value2string(val[i]);
          }
          res += ']';
        } else {
          res += '"$key":${val.toString()}';
        }
      }
    });
    res += '}';
    return res;
  }

  String _value2string(value) {
    var res = '';
    if (value != null) {
      if (value is String) {
        res += '"$value"';
      } else if (value is Map) {
        res += '${jsonEncode(value)}';
      } else if (value is List) {
        res += '[';
        for (var i = 0; i < value.length; i++) {
          if (i > 0) {
            res += ',';
          }
          res += _value2string(value[i]);
        }
        res += ']';
      } else {
        res += '${value.toString()}';
      }
    }
    return res;
  }
}
