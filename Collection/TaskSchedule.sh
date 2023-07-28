#! /usr/bin/env bash

curl -X PUT "http://ela-master.ed.qa:9200/ed_taskschedule?pretty" -H 'Content-Type: application/json' -d'
{
    "mappings": {
        "_doc": {
            "dynamic": "strict",
            "properties": {
                "uuid": { "type": "keyword" },
                "agent": { "type": "keyword" },
                "name": { "type": "text" },
                "path": { "type": "text" },
                "command": { "type": "text" },
                "lastruntime": { "type": "date" },
                "nextruntime": { "type": "date" },
                "startboundary": { "type": "long" },
                "endboundary": { "type": "integer" }
            }
        }
    }
}
'