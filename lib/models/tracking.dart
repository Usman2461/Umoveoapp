enum statusTrack{sended,confirmed,shipper, shipping, recieveshipment }
class Tracking{
  String time;
  String trackingNo;
  String status;
  String extraDetail;

  Tracking(this.time, this.trackingNo, this.status, this.extraDetail);
}


List<Tracking> listTrack = [
  Tracking("11:24", "123445", "Sended Request", "**********5454"),
  Tracking("11:38", "123445", "Confirmed", ""),
  Tracking("11:38", "123445", "Shipper", "John +123 123 123"),
  Tracking("11:38", "123445", "Shipping", ""),
  Tracking("11:38", "123445", "Recieving", ""),
];



