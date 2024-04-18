import "package:character_creator/models/character.dart";
import "package:character_creator/shared/styled_text.dart";
import "package:character_creator/theme.dart";
import "package:flutter/material.dart";

class StatsTable extends StatefulWidget {
  const StatsTable(this.character, {super.key});

  final Character character;

  @override
  State<StatsTable> createState() => _StatsTableState();
}

class _StatsTableState extends State<StatsTable> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Container(
              color: AppColors.secondaryColor,
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  Icon(
                    Icons.star,
                    color: widget.character.points > 0
                        ? Colors.yellow
                        : Colors.grey,
                  ),
                  const SizedBox(width: 20),
                  const StyledText("Stat points available:"),
                  const Expanded(child: SizedBox()),
                  StyledHeading(widget.character.points.toString())
                ],
              )),
          Table(
              children: widget.character.statsAsFormattedList.map((stat) {
            return TableRow(
                decoration: BoxDecoration(
                    color: AppColors.secondaryColor.withOpacity(0.5)),
                children: [
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: StyledHeading(stat["title"]!),
                    ),
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: StyledHeading(stat["value"]!),
                    ),
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: IconButton(
                      icon:
                          Icon(Icons.arrow_upward, color: AppColors.textColor),
                      onPressed: () {
                        setState(() {
                          widget.character.increaseStat(stat["title"]!);
                        });
                      },
                    ),
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: GestureDetector(
                      child: Icon(Icons.arrow_downward,
                          color: AppColors.textColor),
                      onTap: () {
                        setState(() {
                          widget.character.decreaseStat(stat["title"]!);
                        });
                      },
                    ),
                  ),
                ]);
          }).toList()),
        ],
      ),
    );
  }
}
