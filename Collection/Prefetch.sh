#! /usr/bin/env bash
elasticPrefix=$1

curl -X PUT "http://ela-master.ed.qa:9200/${elasticPrefix}_prefetch?pretty" -H 'Content-Type: application/json' -d'
{
    "mappings": {
        "_doc": {
            "dynamic": "strict",
            "properties": {
                "uuid": { "type": "keyword" },
                "agent": { "type": "keyword" },
                "agentIP": { "type": "keyword" },
                "agentName": { "type": "keyword" },
                "filename": {"type": "text"},
                "processname": {"type": "text"},
                "lastruntime": {"type": "date"},
                "processpath": {"type": "text"},
                "runcount": {"type": "integer"},
                "filesize": {"type": "long"},
                "foldercreatedtime": {"type": "date"},
                "foldermodifiedtime": {"type": "date"},
                "item_main": { "type": "text" },
                "date_main": { "type": "date" },
                "type_main": { "type": "keyword" },
                "etc_main": { "type": "text" }
            }
        }
    }
}
'