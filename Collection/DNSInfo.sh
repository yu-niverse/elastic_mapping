#! /usr/bin/env bash
elasticPrefix=$1

curl -X PUT "http://ela-master.ed.qa:9200/${elasticPrefix}_dnsinfo?pretty" -H 'Content-Type: application/json' -d'
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
                "timetolive": { "type": "integer" },
                "pscomputername": { "type": "text" },
                "caption": { "type": "text" },
                "description": { "type": "text" },
                "elementname": { "type": "text" },
                "instanceid": { "type": "integer" },
                "data": { "type": "text" },
                "datalength": { "type": "integer" },
                "entry": { "type": "text" },
                "name": { "type": "text" },
                "section": { "type": "integer" },
                "status": { "type": "integer" },
                "type": { "type": "integer" },
                "item_main": { "type": "text" },
                "date_main": { "type": "date" },
                "type_main": { "type": "text" },
                "etc_main": { "type": "text" }
            }
        }
    }
}
'