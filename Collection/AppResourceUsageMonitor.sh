#! /usr/bin/env bash

curl -X PUT "http://ela-master.ed.qa:9200/ed_appresourceusagemonitor?pretty" -H 'Content-Type: application/json' -d'
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
                "user_name": { "type": "keyword" },
                "user_sid": { "type": "keyword" },
                "foregroundcycletime": { "type": "long" },
                "backgroundcycletime": { "type": "long" },
                "facetime": { "type": "long" },
                "foregroundbytesread": { "type": "long" },
                "foregroundbyteswritten": { "type": "long" },
                "foregroundnumreadoperations": { "type": "integer" },
                "foregroundnumwriteoperations": { "type": "integer" },
                "foregroundnumberofflushes": { "type": "integer" },
                "backgroundbytesread": { "type": "integer" },
                "backgroundbyteswritten": { "type": "integer" },
                "backgroundnumreadoperations": { "type": "integer" },
                "backgroundnumwriteoperations": { "type": "integer" },
                "backgroundnumberofflushes": { "type": "integer" },
                "interfaceluid": { "type": "keyword" },
                "timestamp": { "type": "date" }
            }
        }
    }
}
'
 