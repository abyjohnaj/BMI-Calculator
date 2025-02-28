import 'package:shared_preferences/shared_preferences.dart';
Future<void>storebool(bool name)async
{
SharedPreferences obj=await SharedPreferences.getInstance();
obj.setBool("myname", name);

}
Future<bool>retrievebool()async
{
SharedPreferences obj2=await SharedPreferences.getInstance();
bool s=obj2.getBool("myname")??false;
return s;

}