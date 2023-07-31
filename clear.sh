#! /usr/bin/env bash

curl -X POST "http://ela-master.ed.qa:9200/ed_chromedownload/_delete_by_query?pretty" -H 'Content-Type: application/json' -d'
{
  "query": {
    "match_all": {}
  }
}
'

curl -X DELETE "http://ela-master.ed.qa:9200/ed_memory?pretty"