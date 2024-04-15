# ! /usr/bin/env bash

curl -X POST "http://192.168.190.121:9200/ed_newcollect/_doc" -H "Content-Type: application/json" -d '{
	"table1": {
	  "table1Text": "def",
	  "tablehihi": 2
  }
}'