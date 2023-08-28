#! /usr/bin/env bash
elasticPrefix=$1

curl -X PUT "http://ela-master.ed.qa:9200/${elasticPrefix}_memory?pretty" -H 'Content-Type: application/json' -d'
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
                "processName": { "type": "text" },
                "processCreateTime": { "type": "date" },
                "processConnectIP": { "type": "text" },
                "dynamicCommand": { "type": "text" },
                "processMD5": { "type": "text" },
                "processPath": { "type": "text" },
                "parentProcessId": { "type": "integer" },        
                "parentProcessName": { "type": "text" },
                "parentProcessPath": { "type": "text" },
                "digitalSign": { "type": "text" },
                "importOtherDLL": { "type": "text" },
                "processId": { "type": "integer" },
                "riskLevel": { "type": "integer" },        
                "injectActive": { "type": "text" },
                "processBeInjected": { "type": "integer" },
                "boot": { "type": "text" },
                "hook": { "type": "text" },
                "hide": { "type": "text" },
                "mode": { "type": "text" },
                "item_main": { "type": "text" },
                "date_main": { "type": "date" },
                "type_main": { "type": "text" },
                "etc_main": { "type": "text" }
            }
        }
    }
}
'