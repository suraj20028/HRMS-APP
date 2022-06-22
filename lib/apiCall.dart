class Employee {
  final int eleft;
  final String eadd;
  final String epdate;

  Employee({required this.eleft, required this.eadd, required this.epdate});

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
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
