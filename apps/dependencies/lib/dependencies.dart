library dependencies;

import 'package:freezed_annotation/freezed_annotation.dart';

export 'package:bloc/bloc.dart';
export 'package:either_dart/either.dart';
export 'package:flutter_bloc/flutter_bloc.dart';
export 'package:flutter_modular/flutter_modular.dart';



const freezedNoHelpers = Freezed(
  when: FreezedWhenOptions.none,
  map: FreezedMapOptions.none,
);
