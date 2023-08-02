#! /usr/bin/env bash

curl -X PUT "http://ela-master.ed.qa:9200/ed_de_edgehistory?pretty" -H 'Content-Type: application/json' -d'
{
    "mappings": {
        "_doc": {
            "dynamic": "strict",
            "properties": {
                "uuid": { "type": "keyword" },
                "agent": { "type": "keyword" },
                "id": { "type": "integer" },
                "url": { "type": "text" },
                "title": { "type": "text" },
                "visit_time": { "type": "date" },
                "visit_count": { "type": "integer" },
                "last_visit_time": { "type": "date" }                
            }
        }
    }
}
'