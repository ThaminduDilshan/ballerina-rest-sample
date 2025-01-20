import ballerina/http;

type LoginRecord readonly& record {|
    string key;
    string userId;
    string username;
    string organization;
|};

table<LoginRecord> key(key) loginRecords = table [
];

service / on new http:Listener(9090) {

    resource function get records() returns LoginRecord[] {

        return loginRecords.toArray();
    }

    resource function post records(LoginRecord loginRecord) returns LoginRecord {
        
        loginRecords.add(loginRecord);
        return loginRecord;
    }
}
