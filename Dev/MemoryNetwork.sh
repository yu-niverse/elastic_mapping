#! /usr/bin/env bash

curl -X PUT "http://ela-master.ed.qa:9200/ed_de_memory_network?pretty" -H 'Content-Type: application/json' -d'
{
    "mappings": {
        "_doc": {
            "dynamic": "strict",
            "properties": {
                "uuid": { "type": "keyword" },
                "agent": { "type": "keyword" },
                "processId" : { "type" : "integer" },
                "address" : { "type" : "text" },
                "timestamp" : { "type" : "date" },
                "processCreateTime": { "type": "date" },
                "connectionInOrOut": { "type" : "boolean" },
                "agentPort": { "type" : "integer"}
            }
        }
    }
}
'