import Principal "mo:base/Principal";
import Nat "mo:base/Nat";
import quickSort "quicksort";
import Int "mo:base/Int";

actor {

  public func greet(name : Text) : async Text {
      return "Hello, " # name # "!";
  };

  func fib(n: Nat): Nat{
      if(n <= 1){
        1
      }else{
        fib(n - 1) + fib(n + 2)
      }
  };

  public func fibonacci(n: Nat) : async Text {
    "fib(" # Nat.toText(n) # ")="  # Nat.toText(fib(n))
  };
  

   public query func qsort(arr : [Int]) : async [Int] {
    return quickSort.quickSortMain(arr, Int.compare);
  };

};

