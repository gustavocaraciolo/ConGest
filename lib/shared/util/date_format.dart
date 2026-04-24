class DateFormatUtils {
  static String datetoDMY(String isoDate) {
    DateTime date = DateTime.parse(isoDate);
    return '${date.day.toString().padLeft(2, '0')}-${date.month.toString().padLeft(2, '0')}-${date.year}';
  }
}
