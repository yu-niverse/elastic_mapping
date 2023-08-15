#! /usr/bin/env bash
elasticPrefix=$1

curl -X PUT "http://ela-master.ed.qa:9200/${elasticPrefix}_networkdatausagemonitor?pretty" -H 'Content-Type: application/json' -d'
{
    "mappings": {
        "_doc": {
            "dynamic": "strict",
            "properties": {
                "uuid": { "type": "keyword" },
                "agent": { "type": "keyword" },
                "agentIP": { "type": "keyword" },
                "agentName": { "type": "keyword" },
                "record_id": { "type": "integer" },
                "app_name": { "type": "text" },
                "app_id": { "type": "integer" },
                "user_name": { "type": "text" },
                "user_sid": { "type": "keyword" },
                "bytes_sent": { "type": "integer" },
                "bytes_recvd": { "type": "integer" },
                "network_adapter": { "type": "text" },
                "network_adapter_guid": { "type": "keyword" },
                "interfaceluid": { "type": "keyword" },
                "timestamp": { "type": "date" },
                "item_main": { "type": "text" },
                "date_main": { "type": "date" },
                "type_main": { "type": "keyword" },
                "etc_main": { "type": "text" }
            }
        }
    }
}
'