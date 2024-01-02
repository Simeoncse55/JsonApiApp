import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'model/stu_models.dart';
import 'controller/controller.dart';

 class Home extends StatefulWidget {
   const Home({super.key});

   @override
   State<Home> createState() => _HomeState();
 }


 class _HomeState extends State<Home> {


  StudentsDetails sd = Get.put(StudentsDetails());
   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sd.fetchStuData();

   }

   @override
   Widget build(BuildContext context) {
     return Scaffold(

       appBar: AppBar(
         title: Text('Students Details'),
         elevation: 0,
         backgroundColor: Colors.teal,


       ),

       body: GetX<StudentsDetails>(

         builder: (_)=>
          ListView.builder(

           itemCount: sd.students.length,
           itemBuilder: (context,index){
             return ListTile(

               leading: CircleAvatar(
                 radius: 25,
                 backgroundImage: NetworkImage(sd.students![index].imageUrl ?? '!'),
               ),

               title:  Text(sd.students![index].name?? 'none'),
              subtitle: Text(sd.students![index].college ?? 'none'),
             );
           },

         ),
       ),



     );
   }
 }
