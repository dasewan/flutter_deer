// enum IndexActionConst {
//   createBorrow,
//   verifyList,
//   liveness,
//   sign,
//   waitRisk,
//   waitReview,
//   waitLoan,
//   livenessRefuse,
//   riskRefuse,
//   reviewRefuse,
//   forwardRepay,
//   normalRepay,
//   overdueRepay,
//   seriousOverdueRepay,
//   reCreateBorrow,
//   reVerifyList,
//   reLiveness,
//   reSign
// }

// extension IndexActionConstExtension on IndexActionConst {
//   int get value => [
//         11, //createBorrow
//         12, //verifyList
//         13, //liveness
//         14, //sign
//         21, //waitRisk
//         22, //waitReview
//         23, //waitLoan
//         31, //livenessRefuse
//         32, //riskRefuse
//         33, //reviewRefuse
//         41, //forwardRepay
//         42, //normalRepay
//         43, //overdueRepay
//         44, //seriousOverdueRepay
//         51, //reCreateBorrow
//         52, //reVerifyList
//         53, //reLiveness
//         54, //reSign
//       ][index];
// }

class IndexActionConst {
  // the instance part
  final int actionNo;

  const IndexActionConst._(this.actionNo);

  @override
  String toString() => 'Colour.$actionNo';
  int get index => values.indexOf(this);

  // the class part
  static const IndexActionConst createVerify = IndexActionConst._(11);
  static const IndexActionConst verifyList = IndexActionConst._(12);
  static const IndexActionConst liveness = IndexActionConst._(13);
  static const IndexActionConst sign = IndexActionConst._(14);
  static const IndexActionConst waitRisk = IndexActionConst._(21);
  static const IndexActionConst waitReview = IndexActionConst._(22);
  static const IndexActionConst waitLoan = IndexActionConst._(23);
  static const IndexActionConst livenessRefuse = IndexActionConst._(31);
  static const IndexActionConst riskRefuse = IndexActionConst._(32);
  static const IndexActionConst reviewRefuse = IndexActionConst._(33);
  static const IndexActionConst forwardRepay = IndexActionConst._(41);
  static const IndexActionConst normalRepay = IndexActionConst._(42);
  static const IndexActionConst overdueRepay = IndexActionConst._(43);
  static const IndexActionConst seriousOverdueRepay = IndexActionConst._(44);
  static const IndexActionConst reCreateBorrow = IndexActionConst._(51);
  static const IndexActionConst reVerifyList = IndexActionConst._(52);
  static const IndexActionConst reLiveness = IndexActionConst._(53);
  static const IndexActionConst reSign = IndexActionConst._(54);

  static List<IndexActionConst> values = [
    createVerify,
    verifyList,
    liveness,
    sign,
    waitRisk,
    waitReview,
    waitLoan,
    livenessRefuse,
    riskRefuse,
    reviewRefuse,
    forwardRepay,
    normalRepay,
    overdueRepay,
    seriousOverdueRepay,
    reCreateBorrow,
    reVerifyList,
    reLiveness,
    reSign
  ];

  static IndexActionConst named(int i) =>
      values.firstWhere((indexAction) => indexAction.actionNo == i,
          orElse: () => const IndexActionConst._(11));
}
