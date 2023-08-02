#! /usr/bin/env bash

curl -X PUT "http://ela-master.ed.qa:9200/ed_userprofiles?pretty" -H 'Content-Type: application/json' -d'
{
    "mappings": {
        "_doc": {
            "dynamic": "strict",
            "properties": {
                "uuid": { "type": "keyword" },
                "agent": { "type": "keyword" },
                "username": { "type": "text" },
                "profilepath": { "type": "text" },
                "usersid": { "type": "keyword" },
                "registryloaded": { "type": "boolean" },
                "foldercreatedtime": { "type": "date" },
                "foldermodifiedtime": { "type": "date" },
                "lastlogontime": { "type": "date" },
                "privileglevel": { "type": "text" }
            }
        }
    }
}
'