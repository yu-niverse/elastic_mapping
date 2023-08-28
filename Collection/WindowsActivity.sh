#! /usr/bin/env bash
elasticPrefix=$1

curl -X PUT "http://ela-master.ed.qa:9200/${elasticPrefix}_windowsactivity?pretty" -H 'Content-Type: application/json' -d'
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
                "user_name": { "type": "text" },
                "app_id": { "type": "text" },
                "app_activity_id": { "type": "text" },
                "activity_type": { "type": "text" },
                "activity_status": { "type": "text" },
                "tag": { "type": "text" },
                "group": { "type": "text" },
                "priority": { "type": "integer" },
                "is_local_only": { "type": "boolean" },
                "etag": { "type": "integer" },
                "created_in_cloud": { "type": "date" },
                "last_modified_time": { "type": "date" },
                "expiration_time": { "type": "date" },
                "start_time": { "type": "date" },
                "end_time": { "type": "date" },
                "last_modified_on_client": { "type": "date" },
                "item_main": { "type": "text" },
                "date_main": { "type": "date" },
                "type_main": { "type": "text" },
                "etc_main": { "type": "text" }
            }
        }
    }
}
'