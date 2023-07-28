#! /usr/bin/env bash

curl -X PUT "http://ela-master.ed.qa:9200/ed_chromekeywordsearch?pretty" -H 'Content-Type: application/json' -d'
{
    "mappings": {
        "_doc": {
            "dynamic": "strict",
            "properties": {
                "uuid": { "type": "keyword" },
                "agent": { "type": "keyword" },
                "term": { "type": "text" },
                "title": { "type": "text" },
                "url": { "type": "text" }
            }
        }
    }
}
'