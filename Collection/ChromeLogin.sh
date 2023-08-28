#! /usr/bin/env bash
elasticPrefix=$1

curl -X PUT "http://ela-master.ed.qa:9200/${elasticPrefix}_chromelogin?pretty" -H 'Content-Type: application/json' -d'
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
                "origin_url": { "type": "text" },
                "action_url": { "type": "text" },
                "username_element": { "type": "text" },
                "username_value": { "type": "text" },
                "password_element": { "type": "text" },
                "password_value": { "type": "text" },
                "date_created": { "type": "date" },
                "item_main": { "type": "text" },
                "date_main": { "type": "date" },
                "type_main": { "type": "text" },
                "etc_main": { "type": "text" }
            }
        }
    }
}
'