import Nat "mo:base/Nat";
import Int "mo:base/Int";
import Text "mo:base/Text";

actor {

  stable var currentValue : Nat = 0;

  // 自增
  public func increment() : async () {
    currentValue += 1;
  };

  // 读取值
  public query func get() : async Nat {
    currentValue
  };

  // 设置值
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

