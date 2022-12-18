class EmployeModel {
  EmployeModel({
    required this.name,
    required this.country,
    required this.baseSalary,
    required this.status,
    required this.annualTaxTotal,
    required this.insurance,
  });

  String name;
  String country;
  int baseSalary;
  Status status;
  int annualTaxTotal;
  int insurance;

  static EmployeModel fromJson(json) => EmployeModel(
        name: json["name"],
        country: json["country"],
        baseSalary: json["base_salary"],
        status: Status.fromJson(json["status"]),
        annualTaxTotal: json["annual_tax_total"],
        insurance: json["insurance"],
      );
}

class Status {
  Status({
    required this.maritalStatus,
    required this.ptkp,
  });

  String maritalStatus;
  int ptkp;

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        maritalStatus: json["marital_status"],
        ptkp: json["ptkp"],
      );

  Map<String, dynamic> toJson() => {
        "marital_status": maritalStatus,
        "ptkp": ptkp,
      };
}
