import 'package:quiver/core.dart';

export 'models_list_model.dart';
export 'model_details_model.dart';
export 'manufacturer_item_model.dart';
export 'manufacturer_list_model.dart';
export 'vehicle_types_model.dart';

T? checkOptional<T>(Optional<T?>? optional, T? Function()? def) {
  // No value given, just take default value
  if (optional == null) return def?.call();

  // We have an input value
  if (optional.isPresent) return optional.value;

  // We have a null inside the optional
  return null;
}
