#! /usr/bin/env bash
elasticPrefix=$1

curl -X PUT "http://ela-master.ed.qa:9200/${elasticPrefix}_startrun?pretty" -H 'Content-Type: application/json' -d'
{
    "mappings": {
        "_doc": {
            "dynamic": "strict",
            "properties": {
                "uuid": { "type": "text" },
                "agent": { "type": "text" },
                "agentIP": { "type": "keyword" },
                "agentName": { "type": "keyword" },
                "name": { "type": "text" },
                "command": { "type": "text" },
                "user": { "type": "text" },
                "location": { "type": "text" },
                "caption": { "type": "text" },
                "description": { "type": "text" },
                "usersid": { "type": "keyword" },
                "item_main": { "type": "text" },
                "date_main": { "type": "date" },
                "type_main": { "type": "keyword" },
                "etc_main": { "type": "text" }
            }
        }
    }
}
'