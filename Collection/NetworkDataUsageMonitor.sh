#! /usr/bin/env bash

curl -X PUT "http://ela-master.ed.qa:9200/ed_networkdatausagemonitor?pretty" -H 'Content-Type: application/json' -d'
{
    "mappings": {
        "_doc": {
            "dynamic": "strict",
            "properties": {
                "uuid": { "type": "keyword" },
                "agent": { "type": "keyword" },
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
                "timestamp": { "type": "date" }
            }
        }
    }
}
'