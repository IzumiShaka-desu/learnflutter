extension TimeParser on DateTime {
  String getTimeString() {
    var duration = Duration(seconds: DateTime.now().difference(this).inSeconds);
    if (duration.inMinutes < 60) {
      return ' ${duration.inMinutes} minutes ago';
    } else if (duration.inHours < 24) {
      return ' ${duration.inHours} hours ago';
    } else {
      var durationsInDay = duration.inDays;
      if (durationsInDay >= 365) {
        var inYears = (durationsInDay ~/ 365);
        return ' $inYears years ago';
      } else if (durationsInDay >= 30) {
        var inMonths = durationsInDay ~/ 30;
        return ' $inMonths months ago';
      } else if (durationsInDay >= 7) {
        var inWeeks = durationsInDay ~/ 7;
        return ' $inWeeks weeks ago';
      } else {
        return ' $durationsInDay days ago';
      }
    }
  }
}
