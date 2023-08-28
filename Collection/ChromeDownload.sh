#! /usr/bin/env bash
elasticPrefix=$1

curl -X PUT "http://ela-master.ed.qa:9200/${elasticPrefix}_chromedownload?pretty" -H 'Content-Type: application/json' -d'
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
                "download_url": { "type": "text" },
                "guid": { "type": "text" },
                "current_path": { "type": "text" },
                "target_path": { "type": "text" },
                "received_bytes": { "type": "long" },
                "total_bytes": { "type": "long" },
                "start_time": { "type": "date" },
                "end_time": { "type": "date" },
                "last_access_time": { "type": "date" },
                "danger": { "type": "text" },
                "interrupt_reason": { "type": "text" },
                "opened": { "type": "boolean" },
                "referrer": { "type": "text" },
                "site_url": { "type": "text" },
                "tab_url": { "type": "text" },
                "tab_referrer_url": { "type": "text" },
                "etag": { "type": "text" },
                "last_modified": { "type": "date" },
                "mime_type": { "type": "text" },
                "original_mime_type": { "type": "text" },            
                "item_main": { "type": "text" },
                "date_main": { "type": "date" },
                "type_main": { "type": "text" },
                "etc_main": { "type": "text" }
            }
        }
    }
}
'