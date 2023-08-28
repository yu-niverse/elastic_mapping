#! /usr/bin/env bash
elasticPrefix=$1

curl -X PUT "http://ela-master.ed.qa:9200/${elasticPrefix}_baseservice?pretty" -H 'Content-Type: application/json' -d'
{
    "settings": {
        "number_of_shards": 1,
        "number_of_replicas": 1
    },
    "mappings": {
        "_doc": {
            "dynamic": "strict",
            "properties": {
                "uuid": { "type": "keyword" },
                "agent": { "type": "keyword" },
                "agentIP": { "type": "ip" },
                "agentName": { "type": "text" },
                "name": { "type": "text" },
                "caption": { "type": "text" },
                "description": { "type": "text" },
                "displayname": { "type": "text" },
                "errorcontrol": { "type": "text" },
                "pathname": { "type": "text" },
                "creationclassname": { "type": "text" },
                "servicetype": { "type": "text" },
                "started": { "type": "text" },
                "startmode": { "type": "text" },
                "startname": { "type": "text" },
                "state": { "type": "text" },
                "status": { "type": "text" },
                "systemname": { "type": "text" },
                "acceptpause": { "type": "boolean" },
                "acceptstop": { "type": "boolean" },
                "item_main": { "type": "text" },
                "date_main": { "type": "date" },
                "type_main": { "type": "text" },
                "etc_main": { "type": "text" }
            }
        }
    }
}
'