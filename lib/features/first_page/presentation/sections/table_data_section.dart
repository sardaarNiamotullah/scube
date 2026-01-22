import 'package:flutter/material.dart';
import 'package:scube/core/themes/custom_theme.dart';
import 'package:scube/core/utils/text_utils.dart';

class TableDataSection extends StatelessWidget {
  const TableDataSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildTableHeader(context),
        _buildTableRow(
          context,
          title: 'AC Max Power',
          previousValue: '1636.5 kW',
          currentValue: '2121.88 kW',
        ),
        _buildTableRow(
          context,
          title: 'Net Energy',
          previousValue: '6439.6 kWh',
          currentValue: '4876.77 kWh',
          isOddNumber: false,
        ),
        _buildTableRow(
          context,
          title: 'Specific Yield',
          previousValue: '1.25 kWh/kWp',
          currentValue: '0.94 kWh/kWp',
        ),
        _buildTableRow(
          context,
          title: 'Net Energy',
          previousValue: '1636.5 kWh',
          currentValue: '2121.88 kWh',
          isOddNumber: false,
        ),
        _buildTableRow(
          context,
          title: 'AC Max Power',
          previousValue: '1636.5 kW',
          currentValue: '2121.88 kW',
          isLastRow: true,
        ),
      ],
    );
  }

  //===================================================================
  // Table header
  //===================================================================
  Widget _buildTableHeader(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(color: CustomTheme.of(context).black, width: .5),
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Row(
        mainAxisAlignment: .spaceBetween,
        children: [
          Expanded(child: Container()),
          Expanded(
            child: Center(
              child: Text(
                'Yesterday\'s Data',
                style: TextUtils.b1Bold(context: context),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                'Today\'s Data',
                style: TextUtils.b1Bold(context: context),
              ),
            ),
          ),
        ],
      ),
    );
  }

  //===================================================================
  // Table row
  //===================================================================
  Widget _buildTableRow(
    BuildContext context, {
    required String title,
    required String previousValue,
    required String currentValue,
    bool isOddNumber = true,
    bool isLastRow = false,
  }) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: isOddNumber ? Colors.white : CustomTheme.of(context).bgPrimary,
        borderRadius: isLastRow
            ? BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              )
            : null,
      ),
      child: Row(
        mainAxisAlignment: .spaceBetween,
        children: [
          Expanded(
            child: Text(title, style: TextUtils.b1Regular(context: context)),
          ),
          Expanded(
            child: Center(
              child: Text(
                previousValue,
                style: TextUtils.b1Bold(context: context),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                currentValue,
                style: TextUtils.b1Bold(context: context),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
