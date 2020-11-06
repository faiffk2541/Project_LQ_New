class orderModel {
  String dateTimeToPay;
  String dateTimeofFinish;
  String datetime;
  String price;

  orderModel(
      {this.dateTimeToPay, this.dateTimeofFinish, this.datetime, this.price});

  // factory orderModel.fromJson(Map<String, dynamic> json) => orderModel(
  //     dateTimeToPay: json['id'],
  //     dateTimeofFinish: json['name'],
  //     datetime: json['quantity'],
  //     price: json['Price']);

  Map<String, dynamic> toMap() {
    return {
      "DateTimeToPay": dateTimeToPay,
      "DateTimeofFinish": dateTimeofFinish,
      "date_time": datetime,
      "price": price
    };
  }
}
