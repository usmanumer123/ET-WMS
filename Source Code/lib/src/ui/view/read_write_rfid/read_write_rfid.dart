import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/ui/widgets/textformfild_widgets.dart';
import 'package:flutter_application_1/src/utils/uidata/color.dart';

class RadWriteRfid extends StatefulWidget {
  const RadWriteRfid({super.key});

  @override
  State<RadWriteRfid> createState() => _RadWriteRfidState();
}

class _RadWriteRfidState extends State<RadWriteRfid> {
  bool? isChecked = true;
  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
        initialIndex: 0,
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Row(
              children: [
                Text('Read/Write RFID',style: TextStyle(color: Colors.white),),
                Spacer(),
                TextButton(onPressed: (){}, child: Text('RESET',style: TextStyle(color: Colors.white)))
              ],
            ),
            backgroundColor: UIDataColors.commonColor,
          ),

          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 50,
                  child: TabBar(
                    tabs:const [
                      Tab(
                        text: 'EPC',
                      ),
                      Tab(
                        text: 'TID',
                      ),
                      Tab(
                        text: 'RESERVED',
                      ),
                      Tab(
                        text: 'USER',
                      ),
                    ],
                  ),
                ),
                Container(
                  color: Colors.grey.shade200,
                  child: TextFormFildWidgets(
                    read: true,
                    title: 'EPC Binary Encoding(HEX)',
                    onPressd: () {
                    },
                  ),
                ),
                Row(
                  children: [
                    Checkbox(
                      // tristate: true,

                      value: isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          isChecked = value;
                        });
                      },
                    ),
                    Text('Allow Writing Tag',style: TextStyle(color: Colors.grey),),
                  ],
                ),
                Container(
                  color: Colors.grey.shade200,
                  child: TextFormFildWidgets(
                    read: true,
                    title: 'Write Offset(Words)',
                    onPressd: () {
                    },
                  ),
                ),
                Align(alignment: Alignment.centerRight,
                    child: Text('1/3')),
                Container(
                  color: Colors.grey.shade200,
                  child: TextFormFildWidgets(
                    read: true,
                    title: 'Replace To(HEX)',
                    onPressd: () {
                    },
                  ),
                ),
                Spacer(),
                Row(
                  children: [
                    SizedBox(width:  MediaQuery.of(context).size.height /5,
                      height: 50,

                      child: TextButton(
                        onPressed: (){
                        },
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.grey.shade500,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6)),
                            padding: const EdgeInsets.symmetric(
                              vertical: 10,)),
                        child: const Text('GET EPC',
                            style: TextStyle(color: Colors.white,fontSize: 16)),
                      ),
                    ),
                    Spacer(),
                    SizedBox(
                      width:  MediaQuery.of(context).size.height /5,
                      height: 50,
                      child: TextButton(
                        onPressed: (){
                        },
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.grey.shade500,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6)),
                            padding: const EdgeInsets.symmetric(
                              vertical: 10,)),
                        child: const Text('WRITE',
                            style: TextStyle(color: Colors.white,fontSize: 16)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        )
    );
  }
  // PreferredSize appbar() {
  //   return PreferredSize(
  //     preferredSize: Size.fromHeight(kToolbarHeight),
  //     child: Container(
  //       decoration: BoxDecoration(
  //         boxShadow: [
  //           BoxShadow(
  //             color: Colors.grey.withOpacity(0.5),
  //             spreadRadius: 1.0,
  //             blurRadius: 3.0,
  //             offset: Offset(0.0, 2.0),
  //           ),
  //         ],
  //       ),
  //       child: AppBar(
  //         title: Text(
  //           "Read/Write RFID",
  //           style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
  //         ),
  //         centerTitle: true,
  //         backgroundColor: UIDataColors.commonColor,
  //       ),
  //     ),
  //   );
  // }
}
