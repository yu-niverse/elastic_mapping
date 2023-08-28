#! /usr/bin/env bash
elasticPrefix=$1

curl -X PUT "http://ela-master.ed.qa:9200/${elasticPrefix}_process?pretty" -H 'Content-Type: application/json' -d'
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
                "pid": { "type": "integer" },
                "process_name": { "type": "text" },
                "parent_pid": { "type": "integer" },
                "processcreatetime": { "type": "date" },
                "process_path": { "type": "text" },
                "process_command": { "type": "text" },
                "user_name": { "type": "text" },
                "digitalsignature": { "type": "text" },
                "productname": { "type": "text" },
                "fileversion": { "type": "text" },
                "filedescription": { "type": "text" },
                "companyname": { "type": "text" },
                "priority": { "type": "text" },
                "item_main": { "type": "text" },
                "date_main": { "type": "date" },
                "type_main": { "type": "text" },
                "etc_main": { "type": "text" }
            }
        }
    }
}
'