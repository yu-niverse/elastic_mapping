#! /usr/bin/env bash

curl -X PUT "http://ela-master.ed.qa:9200/ed_arpcache?pretty" -H 'Content-Type: application/json' -d'
{
    "mappings": {
        "_doc": {
            "dynamic": "strict",
            "properties": {
                "uuid": { "type": "keyword" },
                "agent": { "type": "keyword" },
                "agentIP": { "type": "keyword" },
                "agentName": { "type": "keyword" },
                "interface": { "type": "text" },
                "internetaddress": { "type": "ip" },
                "physicaladdress": { "type": "keyword" },
                "type": { "type": "keyword" }
            }
        }
    }
}
'