#! /usr/bin/env bash

curl -X PUT "http://ela.ed.qa:9200/ed_process?pretty" -H 'Content-Type: application/json' -d'
{
    "mappings": {
        "_doc": {
            "dynamic": "strict",
            "properties": {
                "uuid": { "type": "keyword" },
                "agent": { "type": "keyword" },
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
                "priority": { "type": "keyword" }
            }
        }
    }
}
'