#! /usr/bin/env bash

curl -X PUT "http://ela.ed.qa:9200/ed_firefoxhistory?pretty" -H 'Content-Type: application/json' -d'
{
    "mappings": {
        "_doc": {
            "dynamic": "strict",
            "properties": {
                "uuid": { "type": "keyword" },
                "agent": { "type": "keyword" },
                "url": { "type": "text" },
                "title": { "type": "text" },
                "from_url": { "type": "text" },
                "rev_host": { "type": "text" },
                "guid": { "type": "keyword" },
                "description": { "type": "text" },
                "preview_image_url": { "type": "text" },
                "visit_count": { "type": "integer" },
                "visit_date": { "type": "date" },
                "last_visit_date": { "type": "date" }
            }
        }
    }
}
'