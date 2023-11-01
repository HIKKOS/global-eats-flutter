import 'package:flutter/material.dart';

class TextoExpandible extends StatefulWidget {
  final String text;

  const TextoExpandible({
    super.key,
    required this.text,
  });
  @override
  State<TextoExpandible> createState() => _TextoExpandibleState();
}

class _TextoExpandibleState extends State<TextoExpandible>
    with SingleTickerProviderStateMixin {
  bool isTapped = true;
  bool isExpanded = false;
  late bool isDarkMode;

  late int textLenght;
  @override
  void initState() {
    super.initState();
    textLenght = widget.text.length;
  }

  @override
  Widget build(BuildContext context) {
    return textLenght <= 150
        ? _TextoCorto(isDarkMode: isDarkMode, widget: widget)
        : Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: isDarkMode ? Colors.grey[900] : Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    SelectableText(
                        isTapped
                            ? '${widget.text.substring(0, 100)}...'
                            : widget.text,
                        style: const TextStyle(fontSize: 20))
                  ],
                ),
              ),
              _VerMas(
                  isDarkMode: isDarkMode,
                  isTapped: isTapped,
                  onTap: () {
                    setState(() {
                      isTapped = !isTapped;
                    });
                  })
            ],
          );
  }
}

class _TextoCorto extends StatelessWidget {
  const _TextoCorto({
    required this.isDarkMode,
    required this.widget,
  });

  final bool isDarkMode;
  final TextoExpandible widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isDarkMode ? Colors.grey : Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: SelectableText(
                widget.text,
                style: const TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _VerMas extends StatelessWidget {
  const _VerMas({
    required this.isDarkMode,
    required this.isTapped,
    required this.onTap,
  });

  final bool isDarkMode;
  final bool isTapped;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          height: 1,
          color: isDarkMode ? Colors.grey.withAlpha(80) : Colors.grey,
        ),
        Material(
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10)),
          color: isDarkMode ? Colors.grey : Colors.white,
          child: InkWell(
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10)),
            splashFactory: InkSparkle.constantTurbulenceSeedSplashFactory,
            onTap: () => onTap(),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.065,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(isTapped ? 'Ver más' : 'Ver menos',
                      style: TextStyle(
                          fontSize: 18, color: Theme.of(context).primaryColor)),
                  const SizedBox(width: 10),
                  Icon(
                    isTapped
                        ? Icons.arrow_drop_down_rounded
                        : Icons.arrow_drop_up_rounded,
                    color: Theme.of(context).primaryColor,
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
