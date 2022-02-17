import 'package:society/dashboard/user_model.dart';

class ParkingModel {
  String? parkingId;
  int? parkingType;
  int? vechileType;
  String? vechilePlateNumber;
  String? user_id;
  int? vechileCount;


  ParkingModel({
    this.parkingId,
    this.parkingType,
    this.vechileType,
    this.vechilePlateNumber,
    this.user_id,
    this.vechileCount
  });

  factory ParkingModel.fromjson(Map<String, dynamic> data) {
    return ParkingModel(
      parkingId: data['parking_id'],
      parkingType: data['parking_type'],
      vechileType: data['vechile_type'],
      vechilePlateNumber: data['vechile_plate_number'],
      vechileCount:  data ['vechile_count']
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['parking_id'] = this.parkingId;
    data['parking_type'] = this.parkingType;
    data['vechile_type'] = this.vechileType;
    data['vechile_plate_number'] = this.vechilePlateNumber;
    data ['vechile_count'] = this.vechileCount;

    return data;
  }
}
