#! /usr/bin/env bash

curl -X PUT "http://ela-master.ed.qa:9200/ed_windowsactivity?pretty" -H 'Content-Type: application/json' -d'
{
    "mappings": {
        "_doc": {
            "dynamic": "strict",
            "properties": {
                "uuid": { "type": "keyword" },
                "agent": { "type": "keyword" },
                "user_name": { "type": "text" },
                "app_id": { "type": "text" },
                "app_activity_id": { "type": "keyword" },
                "activity_type": { "type": "text" },
                "activity_status": { "type": "keyword" },
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
                "last_modified_on_client": { "type": "date" }
            }
        }
    }
}
'