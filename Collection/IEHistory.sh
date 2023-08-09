#! /usr/bin/env bash

curl -X PUT "http://ela-master.ed.qa:9200/ed_iehistory?pretty" -H 'Content-Type: application/json' -d'
{
    "mappings": {
        "_doc": {
            "dynamic": "strict",
            "properties": {
                "uuid": { "type": "keyword" },
                "agent": { "type": "keyword" },
                "agentIP": { "type": "keyword" },
                "agentName": { "type": "keyword" },
                "url": { "type": "text" },
                "title": { "type": "text" },
                "expirestime": { "type": "date" },
                "lastupdatedtime": { "type": "date" },
                "visitedtime": { "type": "date" }
            }
        }
    }
}
'