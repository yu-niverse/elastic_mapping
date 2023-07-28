#! /usr/bin/env bash

curl -X PUT "http://ela.ed.qa:9200/ed_memory?pretty" -H 'Content-Type: application/json' -d'
{
    "mappings": {
        "_doc": {
            "dynamic": "strict",
            "properties": {
                "uuid": { "type": "keyword" },
                "agent": { "type": "keyword" },
                "processName": { "type": "text" },
                "processConnectIP": { "type": "text" },
                "dynamicCommand": { "type": "text" },
                "processMD5": { "type": "text" },
                "processPath": { "type": "text" },
                "parentProcessId": { "type": "integer" },        
                "parentProcessName": { "type": "text" },
                "parentProcessPath": { "type": "text" },
                "digitalSign": { "type": "text" },
                "importOtherDLL": { "type": "boolean" },
                "processId": { "type": "integer" },
                "riskLevel": { "type": "integer" },        
                "injectActive": { "type": "text" },
                "processBeInjected": { "type": "integer" },
                "boot": { "type": "text" },
                "hook": { "type": "text" },
                "hide": { "type": "text" },
                "mode": { "type": "keyword" }
            }
        }
    }
}
'