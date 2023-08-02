#! /usr/bin/env bash

curl -X PUT "http://ela-master.ed.qa:9200/ed_startrun?pretty" -H 'Content-Type: application/json' -d'
{
    "mappings": {
        "_doc": {
            "dynamic": "strict",
            "properties": {
                "uuid": { "type": "text" },
                "agent": { "type": "text" },
                "name": { "type": "text" },
                "command": { "type": "text" },
                "user": { "type": "text" },
                "location": { "type": "text" },
                "caption": { "type": "text" },
                "description": { "type": "text" },
                "usersid": { "type": "keyword" }
            }
        }
    }
}
'