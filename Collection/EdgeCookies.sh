#! /usr/bin/env bash
elasticPrefix=$1

curl -X PUT "http://ela-master.ed.qa:9200/${elasticPrefix}_edgecookies?pretty" -H 'Content-Type: application/json' -d'
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
                "creation_utc": { "type": "date" },
                "host_key": { "type": "text" },
                "name": { "type": "text" },
                "value": { "type": "text" },
                "encrypted_value": { "type": "text" },
                "expires_utc": { "type": "date" },
                "last_access_utc": { "type": "date" },
                "source_port": { "type": "integer" },
                "item_main": { "type": "text" },
                "date_main": { "type": "date" },
                "type_main": { "type": "keyword" },
                "etc_main": { "type": "text" }
            }
        }
    }
}
'