/// Enum used to control tersity of [prettyDuration].
enum DurationTersity {
  year(1),
  month(12),
  week(5),
  day(7),
  hour(24),
  minute(60),
  second(60),
  millisecond(1000),
  microsecond(1000);

  const DurationTersity(this.mod);

  final int mod;

  int get _id => values.length - index;

  @override
  String toString() => name;

  bool operator >(DurationTersity other) => _id > other._id;
  bool operator <(DurationTersity other) => _id < other._id;
  bool operator >=(DurationTersity other) => _id >= other._id;
  bool operator <=(DurationTersity other) => _id <= other._id;
}

extension DurExt on Duration {
  int get inWeeks => inDays ~/ 7;
  int get inMonths => inDays ~/ 30;
  int get inYears => inDays ~/ 360;

  int inUnit(DurationTersity unit) {
    switch (unit) {
      case DurationTersity.year:
        return inYears;
      case DurationTersity.month:
        return inMonths;
      case DurationTersity.week:
        return inWeeks;
      case DurationTersity.day:
        return inDays;
      case DurationTersity.hour:
        return inHours;
      case DurationTersity.minute:
        return inMinutes;
      case DurationTersity.second:
        return inSeconds;
      case DurationTersity.millisecond:
        return inMilliseconds;
      case DurationTersity.microsecond:
        return inMicroseconds;
    }
  }
}
