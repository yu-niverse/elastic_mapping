#! /usr/bin/env bash
elasticPrefix=$1

curl -X PUT "http://ela-master.ed.qa:9200/${elasticPrefix}_appresourceusagemonitor?pretty" -H 'Content-Type: application/json' -d'
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
                "record_id": { "type": "integer" },
                "app_name": { "type": "text" },
                "app_id": { "type": "integer" },
                "user_name": { "type": "text" },
                "user_sid": { "type": "text" },
                "foregroundcycletime": { "type": "long" },
                "backgroundcycletime": { "type": "long" },
                "facetime": { "type": "long" },
                "foregroundbytesread": { "type": "long" },
                "foregroundbyteswritten": { "type": "long" },
                "foregroundnumreadoperations": { "type": "integer" },
                "foregroundnumwriteoperations": { "type": "integer" },
                "foregroundnumberofflushes": { "type": "integer" },
                "backgroundbytesread": { "type": "integer" },
                "backgroundbyteswritten": { "type": "integer" },
                "backgroundnumreadoperations": { "type": "integer" },
                "backgroundnumwriteoperations": { "type": "integer" },
                "backgroundnumberofflushes": { "type": "integer" },
                "interfaceluid": { "type": "text" },
                "timestamp": { "type": "date" },
                "item_main": { "type": "text" },
                "date_main": { "type": "date" },
                "type_main": { "type": "text" },
                "etc_main": { "type": "text" }
            }
        }
    }
}
'
 