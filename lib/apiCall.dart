class Employee {
  final String eid;
  final int eleft;
  final String eadd;
  final String epdate;

  Employee(
      {required this.eid,
      required this.eleft,
      required this.eadd,
      required this.epdate});

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      eid: json['employeeId'],
      eadd: json['Address'],
      eleft: json['leavesLeft'],
      epdate: json['paySlipDue'],
    );
  }

  Map<String, dynamic> toJson() => {
        'eid': eid,
        'eadd': eadd,
        'eleft': eleft,
        'epdate': epdate,
      };
}
