class Order {
  final String id;
  final String username;
  final String userphone;
  final String status;
  final String docnum;
  final String comment;

  bool isMyFav = false;

  Order(this.id, this.username, this.userphone, this.status, this.docnum,
      this.comment);

  factory Order.fromJson(Map<String, dynamic> json) => Order(
      json['id'],
      json['username'],
      json['userphone'],
      json['status'],
      json['docnum'] ?? '',
      json['comment'],
    );
}
