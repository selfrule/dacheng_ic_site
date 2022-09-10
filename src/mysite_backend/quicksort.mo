import Array "mo:base/Array";
import Order "mo:base/Order";
import Int "mo:base/Int";
import Debug "mo:base/Debug";

module quickSort {

  type Order = Order.Order;

  public func quickSortMain(arr : [Int], sort : (Int, Int) -> Order) : [Int] {
    let len = arr.size();
    // 将不可变数组转换为可变数组
    let result = Array.thaw<Int>(arr);
    sortBy(result, 0, len - 1, sort);
    return Array.freeze(result);
  };


  /**
  * 
  * @param {*} arr  数组
  * @param {*} s  起始下标
  * @param {*} r  结束下标 + 1
  */

  private func sortBy(arr : [var Int], start : Int, end: Int, sort : (Int, Int) -> Order,) {

    // if (arr[i] > arr[i + 1]) {
    //     var temp = arr[i];
    //     arr[i] = arr[i + 1];
    //     arr[i + 1] = temp;
    // }
    var i = start;
    var j = end;
    var temp = arr[0];
    let pivot = arr[Int.abs(i + j) / 2];

    while(i <= j){
        i += 1;
        if(i <= j){
           Debug.print(debug_show(arr[Int.abs(i)]));
          // if(arr[Int.abs(i)] > arr[Int.abs(i + 1)]){
          //   temp := arr[Int.abs(i)];
          //   Debug.print(debug_show(temp));
          // }
        }
     }


  }


  // 将数组进行分区排序
  // private func sortBy(arr : [var Int], left : Int, right : Int, sort : (Int, Int) -> Order,) {
  //   if (left < right) {
  //     var i = left;
  //     var j = right;
  //     var swap  = arr[0];
  //     // 获取中间基准值
  //     let pivot = arr[Int.abs(left + right) / 2];
  //     while (i <= j) {
  //       // 排序分区一（左）
  //       while (Order.isLess(sort(arr[Int.abs(i)], pivot))) {
  //         i += 1;
  //       };
  //       // 排序分区二（右）
  //       while (Order.isGreater(sort(arr[Int.abs(j)], pivot))) {
  //         j -= 1;
  //       };
  //       // 对数组中数值进行比较排序
  //       if (i <= j) {
  //         swap := arr[Int.abs(i)];
  //         arr[Int.abs(i)] := arr[Int.abs(j)];
  //         arr[Int.abs(j)] := swap;
  //         i += 1;
  //         j -= 1;
  //       };
  //     };
  //     if (left < j) {
  //       sortBy(arr, left, j, sort);
  //     };
  //     if (i < right) {
  //       sortBy(arr, i, right, sort);
  //     };
  //   };
  // };
};