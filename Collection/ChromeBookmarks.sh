#! /usr/bin/env bash

curl -X PUT "http://ela-master.ed.qa:9200/ed_chromebookmarks?pretty" -H 'Content-Type: application/json' -d'
{
    "mappings": {
        "_doc": {
            "dynamic": "strict",
            "properties": {
                "uuid": { "type": "keyword" },
                "agent": { "type": "keyword" },
                "agentIP": { "type": "keyword" },
                "agentName": { "type": "keyword" },
                "id": { "type": "integer" },
                "parent": { "type": "integer" },
                "type": { "type": "keyword" },
                "name": { "type": "text" },
                "url": { "type": "text" },
                "guid": { "type": "keyword" },
                "date_added": { "type": "date" },
                "date_modified": { "type": "date" }
            }
        }
    }
}
'