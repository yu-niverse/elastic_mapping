curl -XGET "http://ela-master:9200/my_index/_search?pretty" -H 'Content-Type: application/json' -d'
{
  "query": {
    "match_all": {}
  }
}'