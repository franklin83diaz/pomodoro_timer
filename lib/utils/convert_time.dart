//convert unix time to minutes and seconds
String convertTime(int unixTime) {
  final minutes = unixTime ~/ 60;
  final seconds = unixTime % 60;
  final minutesStr = minutes.toString().padLeft(2, '0');
  final secondsStr = seconds.toString().padLeft(2, '0');
  return '$minutesStr:$secondsStr';
}
