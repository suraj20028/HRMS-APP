class Employee {
  final String url;
  final String ename;
  final int eleft;
  final String eadd;
  final String epdate;

  Employee(
      {required this.url,
      required this.ename,
      required this.eleft,
      required this.eadd,
      required this.epdate});

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      url: json['url'],
      ename: json['firstName'],
      eadd: json['Address'],
      eleft: json['leavesLeft'],
      epdate: json['paySlipDue'],
    );
  }

  Map<String, dynamic> toJson() => {
        'eadd': eadd,
        'eleft': eleft,
        'epdate': epdate,
      };
}
