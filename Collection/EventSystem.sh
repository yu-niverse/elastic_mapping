#! /usr/bin/env bash
elasticPrefix=$1

curl -X PUT "http://ela-master.ed.qa:9200/${elasticPrefix}_eventsystem?pretty" -H 'Content-Type: application/json' -d'
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
                "eventrecordid": { "type": "integer" },
                "providername": { "type": "text" },
                "providerguid": { "type": "text" },
                "eventid": { "type": "long" },
                "version": { "type": "integer" },
                "level": { "type": "text" },
                "keywords": { "type": "text" },
                "task": { "type": "integer" },
                "opcode": { "type": "integer" },
                "createdsystemtime": { "type": "date" },
                "correlationactivityid": { "type": "text" },
                "correlationrelatedactivityid": { "type": "text" },
                "executionprocessid": { "type": "integer" },
                "executionthreadid": { "type": "integer" },
                "channel": { "type": "text" },
                "computer": { "type": "text" },
                "securityuserid": { "type": "text" },
                "evtrenderdata": { "type": "text" },
                "item_main": { "type": "text" },
                "date_main": { "type": "date" },
                "type_main": { "type": "text" },
                "etc_main": { "type": "text" }
            }
        }
    }
}
'