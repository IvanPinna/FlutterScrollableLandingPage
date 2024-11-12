import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scrollable_landing_page/ui/shared/custom_menu_item.dart';

class CustomAppMenu extends StatefulWidget{
  @override
  _CustomAppMenuState createState() => _CustomAppMenuState();
}

class _CustomAppMenuState extends State<CustomAppMenu> with SingleTickerProviderStateMixin{
  
  bool isOpen = false;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(vsync: this, duration: Duration(milliseconds: 200));
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: (){

          if(isOpen){
            controller.reverse();
          } else {
            controller.forward();
          }

          setState(() {
            isOpen = !isOpen;
          });
          
          },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          width: 150,
          height: isOpen ? 308 : 50,
          color: Colors.black,
          child: Column(
            children: [
             _MenuTitle(isOpen: isOpen, controller: controller),

             if(isOpen)
             ...[
             CustomMenuItem(delay: 0, text: 'Home', onPressed: (){}),
             CustomMenuItem(delay: 20, text: 'About', onPressed: (){}),
             CustomMenuItem(delay: 40, text: 'Pricing', onPressed: (){}),
             CustomMenuItem(delay: 60, text: 'Contact', onPressed: (){}),
             CustomMenuItem(delay: 80, text: 'Location', onPressed: (){}),
             SizedBox(height: 8)
             ]
            ]
          )
        ),
      ),
    );
  }
}

class _MenuTitle extends StatelessWidget {
  const _MenuTitle({
    super.key,
    required this.isOpen,
    required this.controller,
  });

  final bool isOpen;
  final AnimationController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 50,
      child: Row(
        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 200), 
            curve: Curves.easeInOut,
            width: isOpen ? 50:0),
          Text('Menú', style: GoogleFonts.roboto(color: Colors.white, fontSize: 18)),
          Spacer(),
          AnimatedIcon(
            icon: AnimatedIcons.menu_close, 
            progress: controller,
            color: Colors.white,)
        ],
      ),
    );
  }
}