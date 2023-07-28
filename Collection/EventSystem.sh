#! /usr/bin/env bash

curl -X PUT "http://ela.ed.qa:9200/ed_eventsystem?pretty" -H 'Content-Type: application/json' -d'
{
    "mappings": {
        "_doc": {
            "dynamic": "strict",
            "properties": {
                "uuid": { "type": "keyword" },
                "agent": { "type": "keyword" },
                "eventrecordid": { "type": "integer" },
                "providername": { "type": "text" },
                "providerguid": { "type": "keyword" },
                "eventid": { "type": "long" },
                "version": { "type": "integer" },
                "level": { "type": "keyword" },
                "keywords": { "type": "text" },
                "task": { "type": "integer" },
                "opcode": { "type": "integer" },
                "createdsystemtime": { "type": "date" },
                "correlationactivityid": { "type": "keyword" },
                "correlationrelatedactivityid": { "type": "keyword" },
                "executionprocessid": { "type": "integer" },
                "executionthreadid": { "type": "integer" },
                "channel": { "type": "keyword" },
                "computer": { "type": "keyword" },
                "securityuserid": { "type": "keyword" },
                "evtrenderdata": { "type": "text" }
            }
        }
    }
}
'