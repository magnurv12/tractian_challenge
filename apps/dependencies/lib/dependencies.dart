library dependencies;

import 'package:freezed_annotation/freezed_annotation.dart';

export 'package:bloc/bloc.dart';
export 'package:collection/collection.dart';
export 'package:either_dart/either.dart';
export 'package:flutter_bloc/flutter_bloc.dart';
export 'package:flutter_modular/flutter_modular.dart';
export 'package:freezed_annotation/freezed_annotation.dart';
export 'package:http/http.dart';

const freezedNoHelpers = Freezed(
  when: FreezedWhenOptions.none,
  map: FreezedMapOptions.none,
);
