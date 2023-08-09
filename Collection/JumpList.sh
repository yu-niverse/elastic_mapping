#! /usr/bin/env bash

curl -X PUT "http://ela-master.ed.qa:9200/ed_jumplist?pretty" -H 'Content-Type: application/json' -d'
{
    "mappings": {
        "_doc": {
            "dynamic": "strict",
            "properties": {
                "uuid": { "type": "keyword" },
                "agent": { "type": "keyword" },
                "agentIP": { "type": "keyword" },
                "agentName": { "type": "keyword" },
                "fullpath": { "type": "text" },
                "application_id": { "type": "keyword" },
                "computer_name": { "type": "keyword" },
                "filesize": { "type": "long" },
                "entry_id": { "type": "integer" },
                "recordtime": { "type": "date" },
                "createtime": { "type": "date" },
                "accesstime": { "type": "date" },
                "modifiedtime": { "type": "date" }
            }
        }
    }
}
'