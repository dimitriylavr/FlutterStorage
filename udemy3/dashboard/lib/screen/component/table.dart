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
          Text(
            "Приёмка",
            style: TextStyle(color: mainColor, fontSize: 30),
          ),
          SizedBox(
            width: double.infinity,
            child: DataTable2(
              columnSpacing: defaultPadding,
              minWidth: 600,
              dataRowHeight: 75,
              columns: [
                DataColumn(label: Text("Фото", style: txtStyle())),
                DataColumn(label: Text("Время", style: txtStyle())),
                DataColumn(label: Text("Модель", style: txtStyle())),
                DataColumn(label: Text("Номер", style: txtStyle())),
                DataColumn(label: Text("Заказчик", style: txtStyle())),
                DataColumn(label: Text("Статус", style: txtStyle())),
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

TextStyle txtStyle() {
  return TextStyle(color: mainColor, fontSize: 18);
}
