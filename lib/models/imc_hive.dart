import 'package:hive/hive.dart';
part 'imc_hive.g.dart';

@HiveType(typeId: 0)
class ImcHive extends HiveObject {
  ImcHive({required this.weight, required this.height, required this.imc});
  @HiveField(0)
  double weight;

  @HiveField(1)
  double height;

  @HiveField(2)
  String imc;
}
