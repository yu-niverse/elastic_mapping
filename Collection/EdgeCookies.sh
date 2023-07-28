#! /usr/bin/env bash

curl -X PUT "http://ela.ed.qa:9200/ed_edgecookies?pretty" -H 'Content-Type: application/json' -d'
{
    "mappings": {
        "_doc": {
            "dynamic": "strict",
            "properties": {
                "uuid": { "type": "keyword" },
                "agent": { "type": "keyword" },
                "id": { "type": "integer" },
                "creation_utc": { "type": "date" },
                "host_key": { "type": "text" },
                "name": { "type": "text" },
                "value": { "type": "text" },
                "encrypted_value": { "type": "text" },
                "expires_utc": { "type": "date" },
                "last_access_utc": { "type": "date" },
                "source_port": { "type": "integer" }
            }
        }
    }
}
'