#! /usr/bin/env bash

curl -X PUT "http://ela-master.ed.qa:9200/ed_userassist?pretty" -H 'Content-Type: application/json' -d'
{
    "mappings": {
        "_doc": {
            "dynamic": "strict",
            "properties": {
                "uuid": { "type": "keyword" },
                "agent": { "type": "keyword" },
                "name": { "type": "text" },
                "classid": { "type": "keyword" },
                "of_times_executed": { "type": "integer" },
                "focus_count": { "type": "integer" },
                "focus_time(s)": { "type": "integer" },
                "modifiedtime": { "type": "date" }
            }
        }
    }
}
'