import 'package:findmee/admin/businessProfiles.dart';
import 'package:findmee/widgets/custom-text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../responsive.dart';

class AdminHome extends StatefulWidget {
  @override
  _AdminHomeState createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> with SingleTickerProviderStateMixin{
  TabController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    double width;
    bool isMobile = Responsive.isMobile(context);
    if(Responsive.isDesktop(context)){
      width = MediaQuery.of(context).size.width*0.3;
    }
    else{
      width = MediaQuery.of(context).size.width*0.7;
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: isMobile?AppBar(
        title: CustomText(text: 'Findme Admin', color: Colors.white,),
        centerTitle: true,
        elevation: 0,
      ):null,
      drawer: isMobile
          ?
            Drawer(
              child: Column(
                children: [
                  Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))
                      ),
                      child: Image.asset('assets/images/logo.png')),
                  ListTile(
                    title: CustomText(text: 'Business Profiles',color: _controller.index==0?Theme.of(context).primaryColor:Colors.black,align: TextAlign.start,),
                    trailing: Icon(Icons.arrow_forward_ios_outlined),
                    onTap: (){
                      setState(() {
                        _controller.animateTo(0);
                      });
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: CustomText(text: 'Recruiter Profiles',color: _controller.index==1?Theme.of(context).primaryColor:Colors.black,align: TextAlign.start,),
                    trailing: Icon(Icons.arrow_forward_ios_outlined),
                    onTap: (){
                      setState(() {
                        _controller.animateTo(1);
                      });
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: CustomText(text: 'Calendar Profiles',color: _controller.index==2?Theme.of(context).primaryColor:Colors.black,align: TextAlign.start,),
                    trailing: Icon(Icons.arrow_forward_ios_outlined),
                    onTap: (){
                      setState(() {
                        _controller.animateTo(2);
                      });
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            )
          :null,
      body: Column(
        children: [
          ///navbar
          if(!isMobile)
          Container(
            color: Color(0xffFA1E0E).withOpacity(0.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              children: [
                ///logo
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                      height: width*0.16,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(bottomRight: Radius.circular(10)),
                        color: Theme.of(context).primaryColor,
                      ),
                      child: Image.asset('assets/images/logo.png')
                  ),
                ),
                Expanded(child: Container()),

                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        _controller.animateTo(0);
                      });
                    },
                    child: CustomText(
                      text: 'Business Profiles',
                      color: _controller.index==0?Theme.of(context).primaryColor:Colors.black,
                      size: width*0.04,
                    ),
                  ),
                ),
                SizedBox(width: 20,),

                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        _controller.animateTo(1);
                      });
                    },
                    child: CustomText(
                      text: 'Recruiter Profiles',
                      color: _controller.index==1?Theme.of(context).primaryColor:Colors.black,
                      size: width*0.04,
                    ),
                  ),
                ),
                SizedBox(width: 30,),

                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        _controller.animateTo(2);
                      });
                    },
                    child: CustomText(
                      text: 'Calendar',
                      color: _controller.index==2?Theme.of(context).primaryColor:Colors.black,
                      size: width*0.04,
                    ),
                  ),
                ),
                SizedBox(width: 30,),
              ],
            ),
          ),

          Expanded(
            child: TabBarView(
              controller: _controller,
              physics: NeverScrollableScrollPhysics(),
              children: [
                BusinessProfiles(),
                Container(),
                Container(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
