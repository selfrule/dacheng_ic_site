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
    sortBy(result, 0, len-1, sort);
    return Array.freeze(result);
  };

  /**
  * 
  * @param {*} arr  数组
  * @param {*} s  起始下标
  * @param {*} r  结束下标 + 1
  */

  private func sortBy(arr : [var Int], start : Int, end: Int, sort : (Int, Int) -> Order,) {

    var i = start;
    var j = end;


    while(i <= j-1){
        var s : Int =0;
          // 防止数组越界 避免查看最后的 `j` 项
        // Debug.print(debug_show(i));
      
        while(s <= j-1-i){
          
           if(arr[Int.abs(s)] > arr[Int.abs(s + 1)]){
             
            let temp : Int = arr[Int.abs(s)];
        
            arr[Int.abs(s)] := arr[Int.abs(s+1)];
            arr[Int.abs(s+1)] := temp;
          };
          s += 1;
        };
        i += 1;
     }
    //  return arr;
  };

  // func swap ( mArr : [var Int], i: Int, j: Int) : [var Int]{
      // let temp : Int= mArr[i];

      // Debug.print(debug_show(mArr));
      // mArr[i] := mArr[j];
      // mArr[j] := temp;
      // return mArr;
  // };
};