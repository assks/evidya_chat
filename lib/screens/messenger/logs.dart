import 'package:flutter/material.dart';

class LogController extends ValueNotifier<List<String>> {
  LogController() : super([]);
  void addLog(String log) {
    value = [ ...value,log,];
  }
  void removeLog(int index){
    value.removeAt(index);
    value = [ ...value];
  }
  void clear(){
    value.clear();
  }
}

class MessageLog extends ValueNotifier<List<String>> {
  MessageLog() : super([]);
  void addLog(String log) {
    value = [ ...value,log,];
  }
  void removeLog(int index){
    value.removeAt(index);
    value = [ ...value];
  }
}
class GroupMessageLog extends ValueNotifier<List<String>> {
  GroupMessageLog() : super([]);
  void addLog(String log) {
    value = [ ...value,log,];
  }
  void removegroupLog(String groupname){
    value.removeWhere((item)=> item == groupname);
    value = [ ...value];
  }
}

class ClassLog extends ValueNotifier<List<String>> {
  ClassLog() : super([]);
  void addLog(String log) {
    value = [ ...value,log,];
  }
  void removeLog(int index){
    value.removeAt(index);
    value = [ ...value];
  }

}
