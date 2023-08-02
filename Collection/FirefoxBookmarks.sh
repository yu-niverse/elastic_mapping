#! /usr/bin/env bash

curl -X PUT "http://ela-master.ed.qa:9200/ed_firefoxbookmarks?pretty" -H 'Content-Type: application/json' -d'
{
    "mappings": {
        "_doc": {
            "dynamic": "strict",
            "properties": {
                "uuid": { "type": "keyword" },
                "agent": { "type": "keyword" },
                "id": { "type": "integer" },
                "parent": { "type": "integer" },
                "type": { "type": "integer" },
                "title": { "type": "text" },
                "dateadded": { "type": "date" },
                "lastmodified": { "type": "date" },
                "guid": { "type": "keyword" },
                "syncstatus": { "type": "integer" },
                "url": { "type": "text" },
                "url_title": { "type": "text" },
                "rev_host": { "type": "text" },
                "url_visit_count": { "type": "integer" },
                "url_last_visit_date": { "type": "date" },
                "url_guid": { "type": "keyword" },
                "url_description": { "type": "text" },
                "preview_image_url": { "type": "text" }
            }
        }
    }
}
'