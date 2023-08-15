#! /usr/bin/env bash
elasticPrefix=$1

curl -X PUT "http://ela-master.ed.qa:9200/${elasticPrefix}_service?pretty" -H 'Content-Type: application/json' -d'
{
    "mappings": {
        "_doc": {
            "dynamic": "strict",
            "properties": {
                "uuid": { "type": "keyword" },
                "agent": { "type": "keyword" },
                "agentIP": { "type": "keyword" },
                "agentName": { "type": "keyword" },
                "name": { "type": "text" },
                "caption": { "type": "text" },
                "description": { "type": "text" },
                "displayname": { "type": "text" },
                "errorcontrol": { "type": "keyword" },
                "pathname": { "type": "text" },
                "processid": { "type": "integer" },
                "servicetype": { "type": "text" },
                "started": { "type": "keyword" },
                "startmode": { "type": "keyword" },
                "startname": { "type": "text" },
                "state": { "type": "keyword" },
                "status": { "type": "keyword" },
                "systemname": { "type": "keyword" },
                "item_main": { "type": "text" },
                "date_main": { "type": "date" },
                "type_main": { "type": "keyword" },
                "etc_main": { "type": "text" }
            }
        }
    }
}
'