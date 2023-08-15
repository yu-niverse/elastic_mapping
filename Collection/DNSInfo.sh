#! /usr/bin/env bash
elasticPrefix=$1

curl -X PUT "http://ela-master.ed.qa:9200/${elasticPrefix}_dnsinfo?pretty" -H 'Content-Type: application/json' -d'
{
    "mappings": {
        "_doc": {
            "dynamic": "strict",
            "properties": {
                "uuid": { "type": "keyword" },
                "agent": { "type": "keyword" },
                "agentIP": { "type": "keyword" },
                "agentName": { "type": "keyword" },
                "timetolive": { "type": "integer" },
                "pscomputername": { "type": "keyword" },
                "caption": { "type": "text" },
                "description": { "type": "text" },
                "elementname": { "type": "keyword" },
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
                "type_main": { "type": "keyword" },
                "etc_main": { "type": "text" }
            }
        }
    }
}
'