import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class BloodEligibility {
  final String id;
  final String blood;
  final List<String> borrow;
  final List<String> donate;
  final Color color;
  const BloodEligibility({
    @required this.id,
    @required this.blood,
    @required this.borrow,
    @required this.donate,
    @required this.color,
  });
}
