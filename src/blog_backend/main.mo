import List "mo:base/List";
import Iter "mo:base/Iter";
import Nat "mo:base/Nat";
import Int "mo:base/Int";
import Text "mo:base/Text";
import Principal "mo:base/Principal";
import Time "mo:base/Time";

actor {

    public type Message = {
         text: Text;
         created_at : Int;
    };

    public type Microblog = actor {
        follow : shared (Principal) -> async (); // 添加关注对象
        follows : shared query () -> async [Principal]; // 返回关注列表
        post : shared (Text) -> async (); // 发布新消息
        posts : shared query (Time.Time) -> async [Message]; // 返回所有发布的消息
        timeline : shared (Time.Time) -> async [Message]; // 返回所有关注对象返回的消息
    };

    stable var followed : List.List<Principal> = List.nil();

    public shared func follow (id: Principal) : async () {
        followed := List.push(id,followed);
    };

    public shared query func follows() : async [Principal]{
        List.toArray(followed);
    };


    stable var messages : List.List<Message> = List.nil();

    public shared (msg) func post(text: Text) : async (){
        // assert(Principal.toText(msg.caller) == "saxii-yoqv7-lul7c-pbxsz-pxqzu-tni2f-yshna-pml6b-u2dly-kta7j-fae");
         let data = {
            text = text;
            created_at = Time.now();
        };
        messages := List.push(data, messages)
    };

    public shared query func posts(since: Time.Time) : async [Message]{
        var posts : List.List<Message> = List.nil();
         for (msg in Iter.fromList(messages)){
            if (msg.created_at >= since) { 
                posts := List.push(msg, posts);
            }
        };

        List.toArray(posts);
    };

    public shared func timeline(since: Time.Time) : async [Message] {
        var all : List.List<Message> = List.nil();
        for(id in Iter.fromList(followed)){
            let canister : Microblog = actor(Principal.toText(id));
            let mesgs = await canister.posts(since);
            for (msg in Iter.fromArray(mesgs)){
                all := List.push(msg, all)
            }
        };
        List.toArray(all);
    };
};

