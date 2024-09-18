import ballerina/grpc;
import ballerina/protobuf;
import ballerina/protobuf.types.empty;
import ballerina/protobuf.types.wrappers;

public const string SHOPPING_DESC = "0A0E73686F7070696E672E70726F746F1A1B676F6F676C652F70726F746F6275662F656D7074792E70726F746F1A1E676F6F676C652F70726F746F6275662F77726170706572732E70726F746F227B0A0D43726561746552657175657374121A0A08757365726E616D651801200128095208757365726E616D65121A0A086C6173746E616D6518022001280952086C6173746E616D65121C0A0966697273746E616D65180320012809520966697273746E616D6512140A05656D61696C1804200128095205656D61696C22280A0E437265617465526573706F6E736512160A06757365726964180120012809520675736572696422640A1253696E676C6555736572526573706F6E7365121A0A086C6173746E616D6518012001280952086C6173746E616D65121C0A0966697273746E616D65180220012809520966697273746E616D6512140A05656D61696C1803200128095205656D61696C32F9020A057573657273122E0A0B6372656174655F75736572120E2E437265617465526571756573741A0F2E437265617465526573706F6E736512320A0B7570646174655F75736572120E2E437265617465526571756573741A132E53696E676C6555736572526573706F6E7365123E0A09766965775F75736572121C2E676F6F676C652E70726F746F6275662E537472696E6756616C75651A132E53696E676C6555736572526573706F6E736512430A0B64656C6574655F75736572121C2E676F6F676C652E70726F746F6275662E537472696E6756616C75651A162E676F6F676C652E70726F746F6275662E456D707479123E0A0D6765745F616C6C5F757365727312162E676F6F676C652E70726F746F6275662E456D7074791A132E53696E676C6555736572526573706F6E7365300112470A0E6765745F736F6D655F7573657273121C2E676F6F676C652E70726F746F6275662E537472696E6756616C75651A132E53696E676C6555736572526573706F6E736528013001620670726F746F33";

public isolated client class usersClient {
    *grpc:AbstractClientEndpoint;

    private final grpc:Client grpcClient;

    public isolated function init(string url, *grpc:ClientConfiguration config) returns grpc:Error? {
        self.grpcClient = check new (url, config);
        check self.grpcClient.initStub(self, SHOPPING_DESC);
    }

    isolated remote function create_user(CreateRequest|ContextCreateRequest req) returns CreateResponse|grpc:Error {
        map<string|string[]> headers = {};
        CreateRequest message;
        if req is ContextCreateRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("users/create_user", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <CreateResponse>result;
    }

    isolated remote function create_userContext(CreateRequest|ContextCreateRequest req) returns ContextCreateResponse|grpc:Error {
        map<string|string[]> headers = {};
        CreateRequest message;
        if req is ContextCreateRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("users/create_user", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <CreateResponse>result, headers: respHeaders};
    }

    isolated remote function update_user(CreateRequest|ContextCreateRequest req) returns SingleUserResponse|grpc:Error {
        map<string|string[]> headers = {};
        CreateRequest message;
        if req is ContextCreateRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("users/update_user", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <SingleUserResponse>result;
    }

    isolated remote function update_userContext(CreateRequest|ContextCreateRequest req) returns ContextSingleUserResponse|grpc:Error {
        map<string|string[]> headers = {};
        CreateRequest message;
        if req is ContextCreateRequest {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("users/update_user", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <SingleUserResponse>result, headers: respHeaders};
    }

    isolated remote function view_user(string|wrappers:ContextString req) returns SingleUserResponse|grpc:Error {
        map<string|string[]> headers = {};
        string message;
        if req is wrappers:ContextString {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("users/view_user", message, headers);
        [anydata, map<string|string[]>] [result, _] = payload;
        return <SingleUserResponse>result;
    }

    isolated remote function view_userContext(string|wrappers:ContextString req) returns ContextSingleUserResponse|grpc:Error {
        map<string|string[]> headers = {};
        string message;
        if req is wrappers:ContextString {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("users/view_user", message, headers);
        [anydata, map<string|string[]>] [result, respHeaders] = payload;
        return {content: <SingleUserResponse>result, headers: respHeaders};
    }

    isolated remote function delete_user(string|wrappers:ContextString req) returns grpc:Error? {
        map<string|string[]> headers = {};
        string message;
        if req is wrappers:ContextString {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        _ = check self.grpcClient->executeSimpleRPC("users/delete_user", message, headers);
    }

    isolated remote function delete_userContext(string|wrappers:ContextString req) returns empty:ContextNil|grpc:Error {
        map<string|string[]> headers = {};
        string message;
        if req is wrappers:ContextString {
            message = req.content;
            headers = req.headers;
        } else {
            message = req;
        }
        var payload = check self.grpcClient->executeSimpleRPC("users/delete_user", message, headers);
        [anydata, map<string|string[]>] [_, respHeaders] = payload;
        return {headers: respHeaders};
    }

    isolated remote function get_all_users() returns stream<SingleUserResponse, grpc:Error?>|grpc:Error {
        empty:Empty message = {};
        map<string|string[]> headers = {};
        var payload = check self.grpcClient->executeServerStreaming("users/get_all_users", message, headers);
        [stream<anydata, grpc:Error?>, map<string|string[]>] [result, _] = payload;
        SingleUserResponseStream outputStream = new SingleUserResponseStream(result);
        return new stream<SingleUserResponse, grpc:Error?>(outputStream);
    }

    isolated remote function get_all_usersContext() returns ContextSingleUserResponseStream|grpc:Error {
        empty:Empty message = {};
        map<string|string[]> headers = {};
        var payload = check self.grpcClient->executeServerStreaming("users/get_all_users", message, headers);
        [stream<anydata, grpc:Error?>, map<string|string[]>] [result, respHeaders] = payload;
        SingleUserResponseStream outputStream = new SingleUserResponseStream(result);
        return {content: new stream<SingleUserResponse, grpc:Error?>(outputStream), headers: respHeaders};
    }

    isolated remote function get_some_users() returns Get_some_usersStreamingClient|grpc:Error {
        grpc:StreamingClient sClient = check self.grpcClient->executeBidirectionalStreaming("users/get_some_users");
        return new Get_some_usersStreamingClient(sClient);
    }
}

public class SingleUserResponseStream {
    private stream<anydata, grpc:Error?> anydataStream;

    public isolated function init(stream<anydata, grpc:Error?> anydataStream) {
        self.anydataStream = anydataStream;
    }

    public isolated function next() returns record {|SingleUserResponse value;|}|grpc:Error? {
        var streamValue = self.anydataStream.next();
        if streamValue is () {
            return streamValue;
        } else if streamValue is grpc:Error {
            return streamValue;
        } else {
            record {|SingleUserResponse value;|} nextRecord = {value: <SingleUserResponse>streamValue.value};
            return nextRecord;
        }
    }

    public isolated function close() returns grpc:Error? {
        return self.anydataStream.close();
    }
}

public isolated client class Get_some_usersStreamingClient {
    private final grpc:StreamingClient sClient;

    isolated function init(grpc:StreamingClient sClient) {
        self.sClient = sClient;
    }

    isolated remote function sendString(string message) returns grpc:Error? {
        return self.sClient->send(message);
    }

    isolated remote function sendContextString(wrappers:ContextString message) returns grpc:Error? {
        return self.sClient->send(message);
    }

    isolated remote function receiveSingleUserResponse() returns SingleUserResponse|grpc:Error? {
        var response = check self.sClient->receive();
        if response is () {
            return response;
        } else {
            [anydata, map<string|string[]>] [payload, _] = response;
            return <SingleUserResponse>payload;
        }
    }

    isolated remote function receiveContextSingleUserResponse() returns ContextSingleUserResponse|grpc:Error? {
        var response = check self.sClient->receive();
        if response is () {
            return response;
        } else {
            [anydata, map<string|string[]>] [payload, headers] = response;
            return {content: <SingleUserResponse>payload, headers: headers};
        }
    }

    isolated remote function sendError(grpc:Error response) returns grpc:Error? {
        return self.sClient->sendError(response);
    }

    isolated remote function complete() returns grpc:Error? {
        return self.sClient->complete();
    }
}

public isolated client class UsersCreateResponseCaller {
    private final grpc:Caller caller;

    public isolated function init(grpc:Caller caller) {
        self.caller = caller;
    }

    public isolated function getId() returns int {
        return self.caller.getId();
    }

    isolated remote function sendCreateResponse(CreateResponse response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendContextCreateResponse(ContextCreateResponse response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendError(grpc:Error response) returns grpc:Error? {
        return self.caller->sendError(response);
    }

    isolated remote function complete() returns grpc:Error? {
        return self.caller->complete();
    }

    public isolated function isCancelled() returns boolean {
        return self.caller.isCancelled();
    }
}

public isolated client class UsersNilCaller {
    private final grpc:Caller caller;

    public isolated function init(grpc:Caller caller) {
        self.caller = caller;
    }

    public isolated function getId() returns int {
        return self.caller.getId();
    }

    isolated remote function sendError(grpc:Error response) returns grpc:Error? {
        return self.caller->sendError(response);
    }

    isolated remote function complete() returns grpc:Error? {
        return self.caller->complete();
    }

    public isolated function isCancelled() returns boolean {
        return self.caller.isCancelled();
    }
}

public isolated client class UsersSingleUserResponseCaller {
    private final grpc:Caller caller;

    public isolated function init(grpc:Caller caller) {
        self.caller = caller;
    }

    public isolated function getId() returns int {
        return self.caller.getId();
    }

    isolated remote function sendSingleUserResponse(SingleUserResponse response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendContextSingleUserResponse(ContextSingleUserResponse response) returns grpc:Error? {
        return self.caller->send(response);
    }

    isolated remote function sendError(grpc:Error response) returns grpc:Error? {
        return self.caller->sendError(response);
    }

    isolated remote function complete() returns grpc:Error? {
        return self.caller->complete();
    }

    public isolated function isCancelled() returns boolean {
        return self.caller.isCancelled();
    }
}

public type ContextSingleUserResponseStream record {|
    stream<SingleUserResponse, error?> content;
    map<string|string[]> headers;
|};

public type ContextCreateRequest record {|
    CreateRequest content;
    map<string|string[]> headers;
|};

public type ContextCreateResponse record {|
    CreateResponse content;
    map<string|string[]> headers;
|};

public type ContextSingleUserResponse record {|
    SingleUserResponse content;
    map<string|string[]> headers;
|};

@protobuf:Descriptor {value: SHOPPING_DESC}
public type CreateRequest record {|
    string username = "";
    string lastname = "";
    string firstname = "";
    string email = "";
|};

@protobuf:Descriptor {value: SHOPPING_DESC}
public type CreateResponse record {|
    string userid = "";
|};

@protobuf:Descriptor {value: SHOPPING_DESC}
public type SingleUserResponse record {|
    string lastname = "";
    string firstname = "";
    string email = "";
|};

