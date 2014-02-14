library distance_calculator;

import 'dart:html';
import 'package:angular/angular.dart';
import 'dart:math' as Math;

@NgComponent(
  selector: 'distance-calculator',
  templateUrl: 'component/distance_calculator.html',
  cssUrl: 'component/distance_calculator.css',
  publishAs: 'cmp')
class DistanceCalculator {
 
  static const double ROME_LAT = 41.895466;
  static const double ROME_LON = 12.482324;
  static const R = 6371; // Kilometers
  
  double distance;

  DistanceCalculator() {
    this.distance = 0.0;
  }
  
  void calculate() {
    window.navigator.geolocation.getCurrentPosition().then((Geoposition e){
      double lat2 = e.coords.latitude;
      double lon2 = e.coords.longitude;
      double dLat = (lat2-ROME_LAT)*Math.PI/180;
      double dLon = (lon2-ROME_LON)*Math.PI/180;
      double a = Math.sin(dLat/2) * Math.sin(dLat/2) +  
              Math.cos(ROME_LAT*Math.PI/180) * Math.cos(lat2*Math.PI/180) *   
              Math.sin(dLon/2) * Math.sin(dLon/2);
      double c = 2*Math.asin(Math.sqrt(a));
      double d = R * c;
      this.distance = double.parse(d.toStringAsFixed(2));
      });
    }
}
