#! /usr/bin/env bash
elasticPrefix=$1

curl -X PUT "http://ela-master.ed.qa:9200/${elasticPrefix}_process?pretty" -H 'Content-Type: application/json' -d'
{
    "mappings": {
        "_doc": {
            "dynamic": "strict",
            "properties": {
                "uuid": { "type": "keyword" },
                "agent": { "type": "keyword" },
                "agentIP": { "type": "keyword" },
                "agentName": { "type": "keyword" },
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
                "priority": { "type": "keyword" },
                "item_main": { "type": "text" },
                "date_main": { "type": "date" },
                "type_main": { "type": "keyword" },
                "etc_main": { "type": "text" }
            }
        }
    }
}
'