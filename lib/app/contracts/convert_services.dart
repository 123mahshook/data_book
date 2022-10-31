class ConvertService {
  static String convertString(data) {
    try {
      if (data != null) {
        return data.toString();
      }
    } catch (e) {}
    return "";
  }

  static int convertInt(data) {
    try {
      return int.parse(data.toString());
    } catch (e) {}
    return 0;
  }

  static num convertNum(data) {
    try {
      return num.parse(data.toString());
    } catch (e) {}
    return 0;
  }

  static double convertDouble(data) {
    try {
      return double.parse(data.toString());
    } catch (e) {}
    return 0;
  }

  static bool convertBool(data) {
    try {
      return data.toString().toLowerCase() == "true";
    } catch (e) {}
    return false;
  }

  static bool convertBoolInt(data) {
    try {
      if (data.toString() == "1") {
        return true;
      }
    } catch (e) {}
    return false;
  }

  static double convertDoubleRound(data) {
    try {
      double num = double.parse(data.toString());
      return double.parse(num.toStringAsFixed(2));
    } catch (e) {}
    return 0;
  }

  static List<String> parseStringList(productJson) {
    try {
      var list = productJson as List;
      List<String> pros = list.map((data) => convertString(data)).toList();
      return pros;
    } catch (_) {}
    return [];
  }

  static List<int> parseIntList(productJson) {
    var list = productJson as List;
    if (list != null) {
      List<int> pros = list.map((data) => convertInt(data)).toList();
      return pros;
    }
    return [];
  }

  static List<double> parseDoubleList(productJson) {
    try {
      var list = productJson as List;
      List<double> pros = list.map((data) => convertDouble(data)).toList();
      return pros;
    } catch (_) {}
    return [];
  }
}
