#! /usr/bin/env bash
elasticPrefix=$1

curl -X PUT "http://ela-master.ed.qa:9200/${elasticPrefix}_shortcuts?pretty" -H 'Content-Type: application/json' -d'
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
                "shortcutname": { "type": "text" },
                "linkpath": { "type": "text" },
                "linkto": { "type": "text" },
                "arguments": { "type": "text" },
                "description": { "type": "text" },
                "workingdirectory": { "type": "text" },
                "iconlocation": { "type": "text" },
                "brokenshortcut": { "type": "boolean" },
                "hotkey": { "type": "text" },
                "showcmd": { "type": "text" },
                "modifytime": { "type": "date" },
                "item_main": { "type": "text" },
                "date_main": { "type": "date" },
                "type_main": { "type": "text" },
                "etc_main": { "type": "text" }
            }
        }
    }
}
'