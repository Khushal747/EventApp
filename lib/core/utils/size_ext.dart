
import 'package:khushal_s_application4/core/utils/size_utils.dart';

extension SizeExt on num {
  double get Sw =>Util.getWidth(this);
      // double.parse(this.toString());
      // Util.getWidth(this);

  double get Sh =>Util.getHeight(this);
      // double.parse(this.toString());
      // Util.getHeight(this);

   double get Sp => Util.getSp(this);
       // double.parse(this.toString());
       // Util.getSp(this);

  double get r =>Util.getRadius(this);
      // double.parse(this.toString());
      // Util.getRadius(this);
}
