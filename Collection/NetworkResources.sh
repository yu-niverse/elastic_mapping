#! /usr/bin/env bash
elasticPrefix=$1

curl -X PUT "http://ela-master.ed.qa:9200/${elasticPrefix}_networkresources?pretty" -H 'Content-Type: application/json' -d'
{
    "mappings": {
        "_doc": {
            "dynamic": "strict",
            "properties": {
                "uuid": { "type": "keyword" },
                "agent": { "type": "keyword" },
                "agentIP": { "type": "keyword" },
                "agentName": { "type": "keyword" },
                "resourcesname": { "type": "text" },
                "resourcestype": { "type": "text" },
                "comment": { "type": "text" },
                "localpath": { "type": "text" },
                "provider": { "type": "text" },
                "scope": { "type": "text" },
                "displaytype": { "type": "text" },
                "usage": { "type": "text" },
                "ipaddress": { "type": "text" },
                "item_main": { "type": "text" },
                "date_main": { "type": "date" },
                "type_main": { "type": "keyword" },
                "etc_main": { "type": "text" }
            }
        }
    }
}
'