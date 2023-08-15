#! /usr/bin/env bash
elasticPrefix=$1

curl -X PUT "http://ela-master.ed.qa:9200/${elasticPrefix}_network?pretty" -H 'Content-Type: application/json' -d'
{
    "mappings": {
        "_doc": {
            "dynamic": "strict",
            "properties": {
                "uuid": { "type": "keyword" },
                "agent": { "type": "keyword" },
                "agentIP": { "type": "keyword" },
                "agentName": { "type": "keyword" },
                "processid": { "type": "integer" },
                "processname": { "type": "text" },
                "localaddress": { "type": "text" },
                "localport": { "type": "integer" },
                "remoteaddress": { "type": "text" },
                "remoteport": { "type": "integer" },
                "state": { "type": "keyword" },
                "remotehostname": { "type": "text" },
                "protocol": { "type": "keyword" },
                "item_main": { "type": "text" },
                "date_main": { "type": "date" },
                "type_main": { "type": "keyword" },
                "etc_main": { "type": "text" }
            }
        }
    }
}
'