#! /usr/bin/env bash

curl -X PUT "http://ela.ed.qa:9200/ed_networkresources?pretty" -H 'Content-Type: application/json' -d'
{
    "mappings": {
        "_doc": {
            "dynamic": "strict",
            "properties": {
                "uuid": { "type": "keyword" },
                "agent": { "type": "keyword" },
                "resourcesname": { "type": "text" },
                "resourcestype": { "type": "text" },
                "comment": { "type": "text" },
                "localpath": { "type": "text" },
                "provider": { "type": "text" },
                "scope": { "type": "text" },
                "displaytype": { "type": "text" },
                "usage": { "type": "text" },
                "ipaddress": { "type": "text" }
            }
        }
    }
}
'