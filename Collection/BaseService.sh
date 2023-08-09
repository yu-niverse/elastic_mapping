#! /usr/bin/env bash

curl -X PUT "http://ela-master.ed.qa:9200/ed_baseservice?pretty" -H 'Content-Type: application/json' -d'
{
    "mappings": {
        "_doc": {
            "dynamic": "strict",
            "properties": {
                "uuid": { "type": "keyword" },
                "agent": { "type": "keyword" },
                "agentIP": { "type": "keyword" },
                "agentName": { "type": "keyword" },
                "name": { "type": "text" },
                "caption": { "type": "text" },
                "description": { "type": "text" },
                "displayname": { "type": "text" },
                "errorcontrol": { "type": "keyword" },
                "pathname": { "type": "text" },
                "creationclassname": { "type": "text" },
                "servicetype": { "type": "text" },
                "started": { "type": "keyword" },
                "startmode": { "type": "keyword" },
                "startname": { "type": "text" },
                "state": { "type": "keyword" },
                "status": { "type": "keyword" },
                "systemname": { "type": "keyword" },
                "acceptpause": { "type": "boolean" },
                "acceptstop": { "type": "boolean" }
            }
        }
    }
}
'