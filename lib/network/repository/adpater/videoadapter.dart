// import 'package:evidya/model/home.dart';
// import 'package:hive/hive.dart';
//
// class RecordedVideoAdapter extends TypeAdapter<RecordedClasses> {
//   @override
//   RecordedClasses read(BinaryReader reader) {
//     final numOfFields = reader.readByte();
//     final fields = <int, dynamic>{
//       for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
//     };
//     return RecordedClasses(
//       thumbnail: fields[0],
//       name: fields[1],
//       specialization:fields[2],
//     );
//   }
//
//   @override
//   final int typeId = 3;
//
//   @override
//   void write(BinaryWriter writer, RecordedClasses obj) {
//     writer
//       ..writeByte(0)
//       ..write(obj.thumbnail)
//       ..writeByte(1)
//       ..write(obj.name)
//       ..writeByte(1)
//       ..write(obj.specialization);
//   }
// }