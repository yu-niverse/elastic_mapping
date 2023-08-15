#! /usr/bin/env bash
elasticPrefix=$1

curl -X PUT "http://ela-master.ed.qa:9200/${elasticPrefix}_firefoxcache?pretty" -H 'Content-Type: application/json' -d'
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
                "url": { "type": "text" },
                "server_response": { "type": "text" },
                "server_name": { "type": "text" },
                "cache_control": { "type": "text" },
                "content_encoding": { "type": "keyword" },
                "content_length": { "type": "integer" },
                "content_type": { "type": "text" },
                "fetch_count": { "type": "integer" },
                "last_fetched": { "type": "date" },
                "last_modified": { "type": "date" },
                "frequency": { "type": "integer" },
                "expiration": { "type": "date" },
                "item_main": { "type": "text" },
                "date_main": { "type": "date" },
                "type_main": { "type": "keyword" },
                "etc_main": { "type": "text" }
            }
        }
    }
}
'