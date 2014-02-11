import 'package:angular/angular.dart';
import 'package:distance_from_rome/component/distance_calculator.dart';

@MirrorsUsed(targets: const ['distance-calculator'], override: '*')
import 'dart:mirrors';

main() {
  ngBootstrap(module: new Module()..type(DistanceCalculator));
} 