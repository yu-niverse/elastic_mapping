#! /usr/bin/env bash

curl -X PUT "http://ela.ed.qa:9200/ed_prefetch?pretty" -H 'Content-Type: application/json' -d'
{
    "mappings": {
        "_doc": {
            "dynamic": "strict",
            "properties": {
                "uuid": { "type": "keyword" },
                "agent": { "type": "keyword" },
                "filename": {"type": "text"},
                "processname": {"type": "text"},
                "lastruntime": {"type": "date"},
                "processpath": {"type": "text"},
                "runcount": {"type": "integer"},
                "filesize": {"type": "integer"},
                "foldercreatedtime": {"type": "date"},
                "foldermodifiedtime": {"type": "date"}
            }
        }
    }
}
'