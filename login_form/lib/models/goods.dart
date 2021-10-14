class Goods {
  final String name;
  final String code;
  final String brande;
  final String price;
  final String q;

  Goods(this.name, this.code, this.brande, this.price, this.q);

  factory Goods.fromJson(Map<String, dynamic> json) => Goods(
        json['name'], json['code'], json['brande'], json['price'], json['q']);
}
