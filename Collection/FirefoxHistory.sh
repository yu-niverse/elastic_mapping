#! /usr/bin/env bash
elasticPrefix=$1

curl -X PUT "http://ela-master.ed.qa:9200/${elasticPrefix}_firefoxhistory?pretty" -H 'Content-Type: application/json' -d'
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
                "from_url": { "type": "text" },
                "rev_host": { "type": "text" },
                "guid": { "type": "keyword" },
                "description": { "type": "text" },
                "preview_image_url": { "type": "text" },
                "visit_count": { "type": "integer" },
                "visit_date": { "type": "date" },
                "last_visit_date": { "type": "date" },
                "item_main": { "type": "text" },
                "date_main": { "type": "date" },
                "type_main": { "type": "keyword" },
                "etc_main": { "type": "text" }
            }
        }
    }
}
'