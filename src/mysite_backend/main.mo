import Principal "mo:base/Principal";
import Nat "mo:base/Nat";
import Int "mo:base/Int";
import quickSort "quicksort";
import Text "mo:base/Text";
// import Counter  "counters";

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

  stable var currentValue : Nat = 0;

  // Increment the counter with the increment function.
  public func increment() : async () {
    currentValue += 1;
  };

  // Read the counter value with a get function.
  public query func get() : async Nat {
    currentValue
  };

  // Write an arbitrary value with a set function.
  public func set(n: Nat) : async () {
    currentValue := n;
  };

  type HttpRequest = {
    body: Blob;
    headers: [HeaderField];
    method: Text;
    url: Text;
  };

  type HttpResponse = {
    body: Blob;
    headers: [HeaderField];
    status_code: Nat16;
  };

  type HeaderField = (Text, Text);

  public query func http_request(arg: HttpRequest) : async HttpResponse {
    {
      body = Text.encodeUtf8("<html><body><h1>CurrentValue: " # Nat.toText(currentValue) # "</h1></body></html>");
      headers = [];
      status_code = 200;
    }
  }

};

