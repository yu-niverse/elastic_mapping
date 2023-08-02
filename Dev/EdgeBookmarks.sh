#! /usr/bin/env bash

curl -X PUT "http://ela-master.ed.qa:9200/ed_de_edgebookmarks?pretty" -H 'Content-Type: application/json' -d'
{
    "mappings": {
        "_doc": {
            "dynamic": "strict",
            "properties": {
                "uuid": { "type": "keyword" },
                "agent": { "type": "keyword" },
                "id": { "type": "integer" },
                "parent": { "type": "integer" },
                "type": { "type": "keyword" },
                "name": { "type": "text" },
                "url": { "type": "text" },
                "source": { "type": "text" },
                "guid": { "type": "keyword" },
                "date_added": { "type": "date" },
                "date_modified": { "type": "date" }
            }
        }
    }
}
'