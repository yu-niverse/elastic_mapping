#! /usr/bin/env bash

curl -X PUT "http://ela-master.ed.qa:9200/ed_de_sqlitesequence?pretty" -H 'Content-Type: application/json' -d'
{
    "mappings": {
        "_doc": {
            "dynamic": "strict",
            "properties": {
                "uuid": { "type": "keyword" },
                "agent": { "type": "keyword" },
                "name": { "type": "text" },
                "seq": { "type": "integer" }
            }
        }
    }
}
'