import 'package:dashboard/constant.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

class MonitorTable extends StatelessWidget {
  MonitorTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: double.infinity,
            child: DataTable2(
              columnSpacing: defaultPadding,
              minWidth: 600,
              dataRowHeight: 75,
              showBottomBorder: true,
              columns: [
                DataColumn(label: Text("Фото", style: txtStyleHeader())),
                DataColumn(label: Text("Время", style: txtStyleHeader())),
                DataColumn(label: Text("Модель", style: txtStyleHeader())),
                DataColumn(label: Text("Номер", style: txtStyleHeader())),
                DataColumn(label: Text("Заказчик", style: txtStyleHeader())),
                DataColumn(label: Text("Статус", style: txtStyleHeader())),
              ],
              rows: List<DataRow>.generate(
                10,
                (index) => DataRow(cells: [
                  DataCell(
                    Row(
                      children: [
                        Image.asset(
                          "images/user.png",
                          height: 50,
                          width: 50,
                        ),
                        const Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: defaultPadding),
                        ),
                      ],
                    ),
                  ),
                  DataCell(
                      Text('B' * (10 - (index + 5) % 10), style: txtStyle())),
                  DataCell(
                      Text('C' * (15 - (index + 5) % 10), style: txtStyle())),
                  DataCell(
                      Text('D' * (15 - (index + 10) % 10), style: txtStyle())),
                  DataCell(
                      Text('E' * (15 - (index + 10) % 10), style: txtStyle())),
                  DataCell(Text("В работе", style: txtStyle()))
                ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

TextStyle txtStyleHeader() {
  return TextStyle(color: redColor, fontSize: 20);
}

TextStyle txtStyle() {
  return TextStyle(color: mainColor, fontSize: 18);
}