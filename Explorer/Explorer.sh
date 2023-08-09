#! /usr/bin/env bash

curl -X PUT "http://ela-master.ed.qa:9200/ed_explorer?pretty" -H 'Content-Type: application/json' -d'
{
    "mappings": {
        "_doc": {
            "dynamic": "strict",
            "properties": {
                "uuid": { "type": "keyword" },
                "agent": { "type": "keyword" },
                "agentIP": { "type": "keyword" },
                "agentName": { "type": "keyword" },
                "fileName": { "type": "text" },
                "isDeleted": { "type": "boolean" },
                "isDirectory": { "type": "boolean" },
                "createTime": { "type": "date" },
                "writeTime": { "type": "date" },
                "accessTime": { "type": "date" },
                "entryModifiedTime": { "type": "date" },
                "dataLen": { "type": "long" }
            }
        }
    }
}
'