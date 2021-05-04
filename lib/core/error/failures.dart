import 'package:equatable/equatable.dart';
import 'package:navigator_test/generated/l10n.dart';

abstract class Failure extends Equatable {
  @override
  List<Object> get props => [errorMessage];

  String get errorMessage => S.current.defaultError;
}