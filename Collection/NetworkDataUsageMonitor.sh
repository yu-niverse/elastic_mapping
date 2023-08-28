#! /usr/bin/env bash
elasticPrefix=$1

curl -X PUT "http://ela-master.ed.qa:9200/${elasticPrefix}_networkdatausagemonitor?pretty" -H 'Content-Type: application/json' -d'
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
                "record_id": { "type": "integer" },
                "app_name": { "type": "text" },
                "app_id": { "type": "integer" },
                "user_name": { "type": "text" },
                "user_sid": { "type": "text" },
                "bytes_sent": { "type": "integer" },
                "bytes_recvd": { "type": "long" },
                "network_adapter": { "type": "text" },
                "network_adapter_guid": { "type": "text" },
                "interfaceluid": { "type": "text" },
                "timestamp": { "type": "date" },
                "item_main": { "type": "text" },
                "date_main": { "type": "date" },
                "type_main": { "type": "text" },
                "etc_main": { "type": "text" }
            }
        }
    }
}
'