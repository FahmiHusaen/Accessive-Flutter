import 'package:flutter/material.dart';
import 'package:flutter_appbb/Components/RoundedButton.dart';

class SlideUpFilterPanelContainer extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return  SlideUpFilterPanelContainerState();
  }

  final BuildContext? context;
  final String? title;
  final Widget? child;
  final String? saveButtonTitle;
  final Function()? onSaveTap;

  const SlideUpFilterPanelContainer({
    Key? key,
    this.context,
    this.title,
    this.child,
    this.saveButtonTitle,
    this.onSaveTap
  }) : super(key: key);

}

class SlideUpFilterPanelContainerState extends State<SlideUpFilterPanelContainer>{

  @override
  Widget build(BuildContext context){
    return DraggableScrollableSheet(
      expand: false,
      maxChildSize: 0.9,
      minChildSize: 0.6,
      initialChildSize: 0.6,
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
          child: Column(
            //shrinkWrap: true,
            //controller: controller,
            //physics: const NeverScrollableScrollPhysics(),
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Column(
                children: [
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
                ],
              ),
              Flexible(child:
              ListView(
                controller: controller,
                shrinkWrap: true,
                children: [
                  widget.child!
                ],
              )
              ),
              Container(
                width: double.infinity,
                child: RoundedButton(
                  text: widget.saveButtonTitle,
                  press: (){
                    //Start Searching
                    widget.onSaveTap!();
                  },
                ),
              )
            ],
          ),
        );
        },
    );
  }
}