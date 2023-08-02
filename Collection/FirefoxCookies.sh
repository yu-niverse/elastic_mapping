#! /usr/bin/env bash

curl -X PUT "http://ela-master.ed.qa:9200/ed_firefoxcookies?pretty" -H 'Content-Type: application/json' -d'
{
    "mappings": {
        "_doc": {
            "dynamic": "strict",
            "properties": {
                "uuid": { "type": "keyword" },
                "agent": { "type": "keyword" },
                "id": { "type": "integer" },
                "name": { "type": "text" },
                "value": { "type": "text" },
                "host": { "type": "text" },
                "path": { "type": "text" },
                "lastaccessed": { "type": "date" },
                "creationtime": { "type": "date" }
            }
        }
    }
}
'