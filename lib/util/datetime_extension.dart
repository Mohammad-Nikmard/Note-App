extension Timer on DateTime {
  String converToHour() {
    if (hour == 0) {
      return "0$hour";
    } else {
      return "$hour";
    }
  }

  String converToMinute() {
    if (minute == 0) {
      return "0$minute";
    } else {
      return "$minute";
    }
  }
}
