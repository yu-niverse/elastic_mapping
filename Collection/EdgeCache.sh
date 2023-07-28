#! /usr/bin/env bash

curl -X PUT "http://ela.ed.qa:9200/ed_edgecache?pretty" -H 'Content-Type: application/json' -d'
{
    "mappings": {
        "_doc": {
            "dynamic": "strict",
            "properties": {
                "uuid": { "type": "keyword" },
                "agent": { "type": "keyword" },
                "id": { "type": "integer" },
                "url": { "type": "text" },
                "web_site": { "type": "text" },
                "frame": { "type": "text" },
                "cache_control": { "type": "text" },
                "content_encoding": { "type": "keyword" },
                "content_length": { "type": "integer" },
                "content_type": { "type": "text" },
                "date": { "type": "date" },
                "expires": { "type": "date" },
                "last_modified": { "type": "date" },
                "server": { "type": "text" },
                "usage_counter": { "type": "integer" },
                "reuse_counter": { "type": "integer" }
            }
        }
    }
}
'