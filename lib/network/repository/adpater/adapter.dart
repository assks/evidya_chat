// import 'package:evidya/model/home.dart';
// import 'package:hive/hive.dart';
//
// class OngoingClassAdapter extends TypeAdapter<OngoingClasses> {
//   @override
//   OngoingClasses read(BinaryReader reader) {
//     final numOfFields = reader.readByte();
//     final fields = <int, dynamic>{
//       for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
//     };
//     return OngoingClasses(
//       thumbnail: fields[0],
//       streamUrl: fields[1],
//     );
//   }
//
//   @override
//   final int typeId = 1;
//
//   @override
//   void write(BinaryWriter writer, OngoingClasses obj) {
//     writer
//       ..writeByte(0)
//       ..write(obj.thumbnail)
//       ..writeByte(1)
//       ..write(obj.streamUrl);
//   }
// }
//
// class BestInstructorsAdapter extends TypeAdapter<BestInstructors> {
//   @override
//   BestInstructors read(BinaryReader reader) {
//     final numOfFields = reader.readByte();
//     final fields = <int, dynamic>{
//       for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
//     };
//     return BestInstructors(
//       thumbnail: fields[0],
//       name: fields[1],
//       specialization:fields[2],
//     );
//   }
//
//   @override
//   final int typeId = 2;
//
//   @override
//   void write(BinaryWriter writer, BestInstructors obj) {
//     writer
//       ..writeByte(0)
//       ..write(obj.thumbnail)
//       ..writeByte(1)
//       ..write(obj.name)
//     ..writeByte(1)
//     ..write(obj.specialization);
//   }
// }
