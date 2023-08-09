#! /usr/bin/env bash

curl -X PUT "http://ela-master.ed.qa:9200/ed_de_main?pretty" -H 'Content-Type: application/json' -d'
{
    "mappings": {
        "_doc": {
            "dynamic": "strict",
            "properties": {
                "uuid": { "type": "keyword" },
                "agentIP": { "type": "keyword" },
                "agentName": { "type": "keyword" },
                "type": { "type": "keyword" },
                "item": { "type": "text" },
                "date": { "type": "date" },
                "agent": { "type": "keyword" },
                "index": { "type": "keyword" },
                "etc": { "type": "text" }
            }
        }
    }
}
'