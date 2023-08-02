#! /usr/bin/env bash

curl -X PUT "http://ela-master.ed.qa:9200/ed_de_edgelogin?pretty" -H 'Content-Type: application/json' -d'
{
    "mappings": {
        "_doc": {
            "dynamic": "strict",
            "properties": {
                "uuid": { "type": "keyword" },
                "agent": { "type": "keyword" },
                "id": { "type": "integer" },
                "origin_url": { "type": "text" },
                "action_url": { "type": "text" },
                "username_element": { "type": "text" },
                "username_value": { "type": "keyword" },
                "password_element": { "type": "text" },
                "password_value": { "type": "keyword" },
                "date_created": { "type": "date" }
            }
        }
    }
}
'