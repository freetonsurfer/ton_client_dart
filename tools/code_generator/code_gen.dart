import 'dart:io';
import 'dart:convert';

void appendFile(File file, String str) {
  file.writeAsStringSync(str, mode: FileMode.append);
}

void createComment(map, file) {
  if (map['description'] != null) {
    final strs = map['description'].split('\n');
    for (var str in strs) {
      appendFile(file, '///${str}\n');
    }
  } else if (map['summary'] != null) {
    appendFile(file, '///${map["summary"]}\n');
  }
}

//==============================================================================
//==============================================================================
//==============================================================================

String getFunctionResultType(Map<String, dynamic> result) {
  if (result['generic_args'][0]['type'] == 'Ref') {
    String str = result['generic_args'][0]['ref_name'];
    return '${str.substring(str.indexOf('.') + 1)}';
  } else if (result['generic_args'][0]['type'] == 'None') {
    return 'void';
  } else {
    throw ('getFunctionResultType> no result type\n${result.toString()}');
  }
}

int getFunctionParamsCount(List<dynamic> params) {
  return params.length - 1;
}

void createFunctionParams(List<dynamic> params, File file) {
  if (params.length == 1) {
    appendFile(file, '() async {\n');
    return;
  } else if (params.length == 2) {
    appendFile(
        file, '(${jsonFieldTypeToDartType(params[1])} params) async {\n');
    return;
  } else if (params.length == 3) {
    appendFile(file,
        '(${jsonFieldTypeToDartType(params[1])} params, [Function responseHandler]) async {\n');
    return;
  }
  throw ('getFunctionParamsAndAppendFile> unknown params length');
}

String getFunctionBody(int pCount, String funcname, String restype) {
  String body;
  if (pCount == 0) {
    body = "await _tonCore.request('$funcname');";
  } else if (pCount == 1) {
    body = "await _tonCore.request('$funcname',params.toString());";
  } else if (pCount == 2) {
    body =
        "await _tonCore.request('$funcname',params.toString(),responseHandler);";
  } else {
    throw ('getFunctionBody> unknown pCount');
  }

  if (restype == "void") {
    return body;
  } else {
    return "final res = $body\n return $restype.fromMap(res);";
  }
}

void createModuleFile(final module) {
  var fModule = File('output/${module['name']}_module.dart');
  fModule.createSync();
  createComment(module, fModule);
  fModule.writeAsStringSync(
      "part of 'tonsdkmodule.dart';\n\nclass ${module['name'][0].toUpperCase()}${module['name'].substring(1)}Module extends _TonSdkModule {\n  ${module['name'][0].toUpperCase()}${module['name'].substring(1)}Module(TonSdkCore core) : super(core);\n\n");
  //create functions
  for (final function in module['functions']) {
    createComment(function, fModule);
    //type
    var resType = getFunctionResultType(function['result']);
    appendFile(fModule, 'Future<$resType> ');
    //name
    appendFile(fModule, function['name']);
    //param
    createFunctionParams(function['params'], fModule);
    //body
    final pCount = getFunctionParamsCount(function['params']);
    appendFile(
        fModule,
        getFunctionBody(
            pCount, module['name'] + '.' + function['name'], resType));
    //end func
    appendFile(fModule, '}\n');
    if (function['errors'] != null) {
      throw ("createModuleFile> function['errors'] != null");
    }
  }
  appendFile(fModule, '}');
}

//==============================================================================
//==============================================================================
//==============================================================================

String fromMap_jsonFieldToList(Map<String, dynamic> varinfo) {
  if ((varinfo['type'] == 'Number') ||
      (varinfo['type'] == 'Boolean') ||
      (varinfo['type'] == 'String')) {
    return 'el';
  }

  if (varinfo['type'] == 'BigInt') {
    return 'BigInt.from(el);';
  }
  if (varinfo['type'] == 'Ref') {
    return varinfo['ref_name'].indexOf('.') != -1
        ? "${varinfo['ref_name'].split('.').last}.fromMap(el)"
        : 'el';
  }

  if (varinfo['type'] == 'Optional') {
    return fromMap_jsonFieldToList(varinfo['optional_inner']);
  }

  print(varinfo);
  throw ('fromMap_jsonFieldTypeToList> unknown type!');
}

String fromMap_jsonFieldToDart(Map<String, dynamic> varinfo, [String varName]) {
  varName ??= varinfo['name'];
  if ((varinfo['type'] == 'Number') ||
      (varinfo['type'] == 'Boolean') ||
      (varinfo['type'] == 'String')) {
    return "_${varName} = map['${varName}'];";
  }
  if (varinfo['type'] == 'BigInt') {
    return "_${varName} = BigInt.from(map['${varName}']);";
  }
  if (varinfo['type'] == 'Array') {
    var res = '_${varName} = [];\n';
    res += "for (var el in map['${varName}']) {\n";
    res += 'if (el != null) {';
    res +=
        "_${varName}.add(${fromMap_jsonFieldToList(varinfo['array_item'])});}";
    res += 'else {_${varName}.add(null);}}';
    return res;
  }
  if (varinfo['type'] == 'Ref') {
    return varinfo['ref_name'].indexOf('.') != -1
        ? "_${varName} = ${varinfo['ref_name'].split('.').last}.fromMap(map['${varName}']);"
        : "_${varName} = map['${varName}'];";
  }
  if (varinfo['type'] == 'Optional') {
    return fromMap_jsonFieldToDart(varinfo['optional_inner'], varName);
  }

  throw ('fromMap_jsonFieldTypeToMap> Unknown type ${varinfo['type']}');
}

String jsonFieldTypeToDartType(Map<String, dynamic> typeinfo) {
  if (typeinfo['type'] == 'Number') {
    assert(typeinfo['number_type'] == 'UInt');
    assert(typeinfo['number_size'] == 32);
    return 'int';
  }
  if (typeinfo['type'] == 'BigInt') {
    assert(typeinfo['number_type'] == 'UInt');
    assert(typeinfo['number_size'] == 64);
    return 'BigInt';
  }
  if (typeinfo['type'] == 'Boolean') {
    return 'bool';
  }
  if (typeinfo['type'] == 'String') {
    return 'String';
  }
  if (typeinfo['type'] == 'Array') {
    return typeinfo['array_item'] != null
        ? 'List<${jsonFieldTypeToDartType(typeinfo['array_item'])}>'
        : 'List<dynamic>';
  }
  if (typeinfo['type'] == 'Ref') {
    return typeinfo['ref_name'].indexOf('.') != -1
        ? '${typeinfo['ref_name'].split('.').last}'
        : 'dynamic';
  }
  if (typeinfo['type'] == 'Optional') {
    assert(typeinfo['optional_inner'] != null);
    return jsonFieldTypeToDartType(typeinfo['optional_inner']);
  }

  //print('${typeinfo}');
  if (typeinfo['type'] == 'Generic') {
    return 'Function';
  }

  throw ('jsonFieldTypeToDartType> Unknown type ${typeinfo['type']}');
}

void createClass(File file, Map<String, dynamic> type, [String parentClass]) {
  createComment(type, file);
  final tn =
      parentClass != null ? parentClass + '_' + type['name'] : type['name'];
  appendFile(file, 'class ${tn} extends ');
  if (parentClass == null) {
    appendFile(file, 'TonSdkStructure{\n');
  } else {
    appendFile(file, '${parentClass}{\n');
  }
  if (parentClass != null) {
    appendFile(file, 'String _type;\n');
    appendFile(file, 'String get type => _type;\n');
  }
  //if (!type.containsKey('struct_fields')) print(type);
  for (final field in type['struct_fields']) {
    final stype = jsonFieldTypeToDartType(field);
    createComment(field, file);
    appendFile(file, '$stype _${field['name']};\n');
    appendFile(file, '$stype get ${field['name']} => _${field['name']};\n');
  }
  //constructor
  appendFile(file, '${tn}(');
  if (type['struct_fields'].length > 0) {
    appendFile(file, '{');
    for (final field in type['struct_fields']) {
      final stype = jsonFieldTypeToDartType(field);
      var requ = '@required';
      if (field['type'] == 'Optional') requ = '';
      appendFile(file, '$requ $stype ${field['name']},');
    }
    appendFile(file, '}');
  }
  appendFile(file, '){\n\n');
  //constructor body
  if (parentClass != null) {
    appendFile(file, "_type = '${type['name']}';\n");
  }
  for (final field in type['struct_fields']) {
    if (field['type'] != 'Optional') {
      appendFile(file,
          "_${field['name']} = ArgumentError.checkNotNull(${field['name']}, '${tn} ${field['name']}');\n");
    } else {
      appendFile(file, '_${field['name']} = ${field['name']};\n');
    }
  }
  appendFile(file, '}\n');
  //end constructor
  //fromMap
  appendFile(file, '${tn}.fromMap(Map<String,dynamic> map){');
  if (parentClass != null) {
    appendFile(file,
        "if (!map.containsKey('type') || map['type']!= '${type['name']}'){throw('Wrong map data');}else{_type = '${type['name']}';}\n");
  }
  for (final field in type['struct_fields']) {
    if (field['type'] == 'Optional') {
      appendFile(file,
          "if (map.containsKey('${field['name']}')&&(map['${field['name']}']!=null)) {${fromMap_jsonFieldToDart(field)}}\n");
    } else {
      appendFile(file,
          "if (map.containsKey('${field['name']}')&&(map['${field['name']}']!=null)) {${fromMap_jsonFieldToDart(field)}}else{throw('Wrong map data');}\n");
    }
  }
  appendFile(file, '}\n\n');
  //end fromMap
  //toMap
  appendFile(file, 'Map<String,dynamic> toMap(){\n');
  appendFile(file, 'Map<String,dynamic> map ={};\n');
  for (final field in type['struct_fields']) {
    appendFile(file,
        "if (_${field['name']}!=null) {map['${field['name']}'] = _${field['name']};}\n");
  }
  if (parentClass != null) {
    appendFile(file, "map['type'] = _type;");
  }
  appendFile(file, 'return map;\n');
  appendFile(file, '}\n');
  //end toMap
  appendFile(file, '}\n\n');
}

//TODO fix it
void createEnumOfTypeRef(file, type, parentname) {
  createComment(type, file);
  final tn = parentname + '_' + type['name'];
  appendFile(file, 'class ${tn} extends ${parentname}{\n');
  appendFile(file, "String _type = '${type['name']}';\n");
  appendFile(file, 'String get type => _type;\n');
  appendFile(file, 'Pasete here ${type['ref_name']} \n');
  appendFile(file, '}\n');
}

void createEnumsOfType(file, type) {
  createComment(type, file);
  appendFile(file, 'abstract class ${type['name']} extends TonSdkStructure{\n');
  appendFile(
      file, 'static ${type['name']} fromMap(Map<String,dynamic> map){\n');
  for (final subtype in type['enum_types']) {
    appendFile(file, "if (map['type']=='${subtype['name']}'){\n");
    appendFile(
        file, "return ${type['name']}_${subtype['name']}.fromMap(map);\n");
    appendFile(file, "}\n");
  }
  appendFile(file, "throw('${type['name']} unknown from map type');\n");
  appendFile(file, '}\n');
  appendFile(file, '}\n\n');
  for (final subtype in type['enum_types']) {
    if (subtype['type'] == 'Struct') {
      createClass(file, subtype, type['name']);
    } else if (subtype['type'] == 'Ref') {
      createEnumOfTypeRef(file, subtype, type['name']);
    } else {
      print(subtype);
      throw ('createEnumsOfType> unknown type name');
    }
  }
}

void createEnumOfConsts(file, type) {
  createComment(type, file);
  appendFile(file, 'class ${type['name']}{\n');
  appendFile(file, 'String _value;\n');
  appendFile(file, 'String get value => _value;\n');

  for (final subtype in type['enum_consts']) {
    createComment(subtype, file);
    appendFile(file, '${type['name']}.${subtype['name']}(){\n');
    appendFile(file, "_value = '${subtype['name']}';}\n");
  }
  appendFile(file, "@override String toString() {return \'\"\$_value\"\';}\n");
  appendFile(file, '${type['name']}.fromMap(str) {_value = str;}\n');
  appendFile(file, '}\n');
}

void createNumberType(file, type) {
  createComment(type, file);
  appendFile(file, '//typedef ${type['name']} int;\n');
}

void createNoneType(file, type) {
  createComment(type, file);
  appendFile(file, '//typedef ${type['name']} void;\n');
}

void createTypeFile(final module) {
  var fModuleType = File('output/${module['name']}_types.dart');
  fModuleType.createSync();
  fModuleType.writeAsStringSync("part of 'tonsdktypes.dart';\n\n");
  for (final type in module['types']) {
    if (type['type'] == 'Struct') {
      createClass(fModuleType, type);
    } else if (type['type'] == 'EnumOfTypes') {
      createEnumsOfType(fModuleType, type);
    } else if (type['type'] == 'EnumOfConsts') {
      createEnumOfConsts(fModuleType, type);
    } else if (type['type'] == 'Number') {
      createNumberType(fModuleType, type);
    } else if (type['type'] == 'None') {
      createNoneType(fModuleType, type);
    } else {
      print(type);
      throw ('createTypeFile> Unknown type!');
    }
  }
}

//==============================================================================
//==============================================================================
//==============================================================================

void main(List<String> arguments) {
  final apiJson = jsonDecode(File('api.json').readAsStringSync());
  final List<dynamic> apiModules = apiJson['modules'];
  for (final module in apiModules) {
    print(module['name']);
    createModuleFile(module);
    createTypeFile(module);
  }
}
