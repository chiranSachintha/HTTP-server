import ballerina/http;
 
service / on new http:Listener(8080) {
 
   resource function get greeting() returns string {
       return "Hello!";// can return any thing.
   }

   resource function get value(int a) returns int {
       return a;// can return any thing.
   }
 
}


service / on new http:Listener(8080) {
 
   resource function post greeting(http:Caller caller,
                                   http:Request request) returns error? {
       string name = check request.getTextPayload();
       check caller->respond(string `Hello, ${name}!`);
   }
 
}
