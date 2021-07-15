import 'package:flutter/material.dart';

class SlideUpFilterPanelContainer extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return  SlideUpFilterPanelContainerState();
  }

  final BuildContext? context;
  final String? title;
  final Widget? child;

  const SlideUpFilterPanelContainer({
    Key? key,
    this.context,
    this.title,
    this.child,
  }) : super(key: key);

}

class SlideUpFilterPanelContainerState extends State<SlideUpFilterPanelContainer>{

  @override
  Widget build(BuildContext context){
    return DraggableScrollableSheet(
      expand: false,
      maxChildSize: 0.8,
      builder: (_, controller) {
        return Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                topLeft: Radius.circular(20),
              ),
              boxShadow:[
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 10.0,
                )
              ]
          ),
          child: ListView(
            shrinkWrap: true,
            controller: controller,
            children: <Widget>[
              Center(child:
              Container(
                height: 8,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                widget.title!,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                  child: widget.child!,
              ),
            ],
          ),
        );
        },
    );
  }
}