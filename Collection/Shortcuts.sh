#! /usr/bin/env bash
elasticPrefix=$1

curl -X PUT "http://ela-master.ed.qa:9200/${elasticPrefix}_shortcuts?pretty" -H 'Content-Type: application/json' -d'
{
    "mappings": {
        "_doc": {
            "dynamic": "strict",
            "properties": {
                "uuid": { "type": "keyword" },
                "agent": { "type": "keyword" },
                "agentIP": { "type": "keyword" },
                "agentName": { "type": "keyword" },
                "shortcutname": { "type": "text" },
                "linkpath": { "type": "text" },
                "linkto": { "type": "text" },
                "arguments": { "type": "text" },
                "description": { "type": "text" },
                "workingdirectory": { "type": "text" },
                "iconlocation": { "type": "text" },
                "brokenshortcut": { "type": "boolean" },
                "hotkey": { "type": "keyword" },
                "showcmd": { "type": "keyword" },
                "modifytime": { "type": "date" },
                "item_main": { "type": "text" },
                "date_main": { "type": "date" },
                "type_main": { "type": "keyword" },
                "etc_main": { "type": "text" }
            }
        }
    }
}
'