# ! /usr/bin/env bash

# curl -XGET 'http://192.168.190.121:9200/ed_newcollect/_search?pretty' -H 'Content-Type: application/json' -d '{
#   "query": {
#       "match_all": {}
#    }
# }'
curl -XGET 'http://192.168.190.121:9200/ed_newcollect/_search?pretty' -H 'Content-Type: application/json' -d '{
  "size": 1000,
  "query": {
    "bool": {
      "must": {
        "query_string": {
          "query": "*abc*",
          "fuzziness": "AUTO"
        }
      },
      "should": [
        {"exists": {"field": "table1"}},
        {"exists": {"field": "d"}}
      ],
      "minimum_should_match": 1
    }
  }
}'