/// Tags for the logger.
///
/// This can be anything you want. It's just a way to categorize your logs, and easier way of finding them
/// in debug console.
enum LogTag {
  general(label: 'GENERAL'),
  ;

  const LogTag({required this.label});

  final String label;
}
