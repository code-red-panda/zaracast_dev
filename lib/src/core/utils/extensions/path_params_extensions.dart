/*
extension PathParamsExtensions on Map<String, String?> {
  int getIntParam(String key, {int defaultValue = 0}) {
    final param = this[key];

    if (param == null) {
      // Return default value if the parameter is missing
      return defaultValue;
    }

    final value = int.tryParse(param);

    if (value == null) {
      // Return default value if parsing fails
      return defaultValue;
    }

    return value;
  }
}
*/
