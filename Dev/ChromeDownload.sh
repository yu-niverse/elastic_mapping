#! /usr/bin/env bash

curl -X PUT "http://ela-master.ed.qa:9200/ed_de_chromedownload?pretty" -H 'Content-Type: application/json' -d'
{
    "mappings": {
        "_doc": {
            "dynamic": "strict",
            "properties": {
                "uuid": { "type": "keyword" },
                "agent": { "type": "keyword" },
                "download_url": { "type": "text" },
                "guid": { "type": "keyword" },
                "current_path": { "type": "text" },
                "target_path": { "type": "text" },
                "received_bytes": { "type": "long" },
                "total_bytes": { "type": "long" },
                "start_time": { "type": "date" },
                "end_time": { "type": "date" },
                "last_access_time": { "type": "date" },
                "danger": { "type": "keyword" },
                "interrupt_reason": { "type": "keyword" },
                "opened": { "type": "boolean" },
                "referrer": { "type": "keyword" },
                "site_url": { "type": "text" },
                "tab_url": { "type": "text" },
                "tab_referrer_url": { "type": "text" },
                "etag": { "type": "keyword" },
                "last_modified": { "type": "date" },
                "mime_type": { "type": "text" },
                "original_mime_type": { "type": "text" }                
            }
        }
    }
}
'