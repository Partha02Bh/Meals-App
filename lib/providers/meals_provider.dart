import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealsapp3/data/dummy_data.dart';

final mealsrPovider = Provider((ref) {
  return dummyMeals;
});