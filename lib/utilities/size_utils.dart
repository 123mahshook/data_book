class SizeUtils {
  static double height = 0;
  static double width = 0;

  static double blockSizeHorizontal = 0;
  static double blockSizeVertical = 0;

  //scree size picking
  static setSize(double screenHeight, double screenWidth) {
    height = screenHeight;
    width = screenWidth;

    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;
  }

  static double getWidth(double widthDt) {
    return setWidth(widthDt) * width /* ScreenUtil().setWidth(width) */;
  }

  static double getHeight(double heightDt) {
    return setHeight(heightDt) * height /* ScreenUtil().setHeight(height) */;
  }

  static double getFont(double fontSize) {
    return setFont(fontSize) * width; /* ScreenUtil().setSp(fontSize); */
  }

  static double getRadius(double radius) {
    return setRadius(radius) * height /* ScreenUtil().radius(radius) */;
  }

  static double getScreenWidth() {
    return width /* ScreenUtil().screenWidth */;
  }

  static double getScreenHeight() {
    return height /* ScreenUtil().screenHeight */;
  }

  //getting fractions of screen size

  static double setWidth(double widthData) {
    return widthData / width;
  }

  static double setHeight(double heightData) {
    return heightData / height;
  }

  static double setFont(double fontSizeData) {
    return fontSizeData / width;
  }

  static double setRadius(double radiusData) {
    return radiusData / height;
  }
}
