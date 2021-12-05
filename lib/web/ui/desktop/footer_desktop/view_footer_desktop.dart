import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_enade/web/ui/widgets/widget_links_footer.dart';

class ViewFooterDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        return Center(
          child: Container(
              alignment: Alignment.bottomCenter,
              width: constraints.maxWidth * 70,
              color: Color(0xFF04132a),
              child: Padding(
                padding: const EdgeInsets.only(top: 32.0,bottom: 32.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: constraints.maxWidth*0.70,
                      child: SelectableText(WidgetLinksFooter().textFootInformation,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 32.0),
                      child: Container(
                        child: FittedBox(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              WidgetLinksFooter().widgetLinksFooter(context: context)
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )),
        );
      },
    );
  }
}
