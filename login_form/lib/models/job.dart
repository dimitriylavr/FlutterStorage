class Job {
  final String name;
  final String phone;
  final String email;
  final String company;

  bool isMyFav=false;

  Job(this.name, this.phone, this.email, this.company);

  factory Job.fromJson(Map<String, dynamic> json) {
    return Job(
        json['name'],
        json['phone'],
        json['email'],
        json['organization']
    );
  }
}