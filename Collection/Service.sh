#! /usr/bin/env bash

curl -X PUT "http://ela.ed.qa:9200/ed_service?pretty" -H 'Content-Type: application/json' -d'
{
    "mappings": {
        "_doc": {
            "dynamic": "strict",
            "properties": {
                "uuid": { "type": "keyword" },
                "agent": { "type": "keyword" },
                "name": { "type": "text" },
                "caption": { "type": "text" },
                "description": { "type": "text" },
                "displayname": { "type": "text" },
                "errorcontrol": { "type": "keyword" },
                "pathname": { "type": "text" },
                "processid": { "type": "integer" },
                "servicetype": { "type": "text" },
                "started": { "type": "keyword" },
                "startmode": { "type": "keyword" },
                "startname": { "type": "text" },
                "state": { "type": "keyword" },
                "status": { "type": "keyword" },
                "systemname": { "type": "keyword" }
            }
        }
    }
}
'