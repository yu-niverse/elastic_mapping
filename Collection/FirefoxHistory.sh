#! /usr/bin/env bash
elasticPrefix=$1

curl -X PUT "http://ela-master.ed.qa:9200/${elasticPrefix}_firefoxhistory?pretty" -H 'Content-Type: application/json' -d'
{
    "settings": {
        "number_of_shards": 1,
        "number_of_replicas": 1
    },
    "mappings": {
        "_doc": {
            "dynamic": "strict",
            "properties": {
                "uuid": { "type": "keyword" },
                "agent": { "type": "keyword" },
                "agentIP": { "type": "ip" },
                "agentName": { "type": "text" },
                "url": { "type": "text" },
                "title": { "type": "text" },
                "from_url": { "type": "text" },
                "rev_host": { "type": "text" },
                "guid": { "type": "text" },
                "description": { "type": "text" },
                "preview_image_url": { "type": "text" },
                "visit_count": { "type": "integer" },
                "visit_date": { "type": "date" },
                "last_visit_date": { "type": "date" },
                "item_main": { "type": "text" },
                "date_main": { "type": "date" },
                "type_main": { "type": "text" },
                "etc_main": { "type": "text" }
            }
        }
    }
}
'