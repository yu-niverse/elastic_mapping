#! /usr/bin/env bash

curl -X PUT "http://ela-master.ed.qa:9200/ed_de_network?pretty" -H 'Content-Type: application/json' -d'
{
    "mappings": {
        "_doc": {
            "dynamic": "strict",
            "properties": {
                "uuid": { "type": "keyword" },
                "agent": { "type": "keyword" },
                "processid": { "type": "integer" },
                "processname": { "type": "text" },
                "localaddress": { "type": "text" },
                "localport": { "type": "integer" },
                "remoteaddress": { "type": "text" },
                "remoteport": { "type": "integer" },
                "state": { "type": "keyword" },
                "remotehostname": { "type": "text" },
                "protocol": { "type": "keyword" }
            }
        }
    }
}
'