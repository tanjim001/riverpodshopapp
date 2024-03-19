import 'package:elearnapp/constant/appconstant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageServie{
  late final SharedPreferences _pref;
  Future <StorageServie>init()async{
  _pref=await SharedPreferences.getInstance();
  return this;
  }
  Future<bool>setString(String key,String value)async{
  return await _pref.setString(key, value);
  }
  Future<bool>setBool(String key,bool value)async{
    return await _pref.setBool(key, value);
  }
  bool getdevicefirstopen(){return _pref.getBool(Appconstant.STORAGE_DEVICE_OPEN_KEY)??false;}
  bool islogin()=>_pref.getString(Appconstant.STORAGE_USER_PROFILE_KEY)!=null?true:false;
}
