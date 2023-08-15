#! /usr/bin/env bash
elasticPrefix=$1

curl -X PUT "http://ela-master.ed.qa:9200/${elasticPrefix}_userprofiles?pretty" -H 'Content-Type: application/json' -d'
{
    "mappings": {
        "_doc": {
            "dynamic": "strict",
            "properties": {
                "uuid": { "type": "keyword" },
                "agent": { "type": "keyword" },
                "agentIP": { "type": "keyword" },
                "agentName": { "type": "keyword" },
                "username": { "type": "text" },
                "profilepath": { "type": "text" },
                "usersid": { "type": "keyword" },
                "registryloaded": { "type": "boolean" },
                "foldercreatedtime": { "type": "date" },
                "foldermodifiedtime": { "type": "date" },
                "lastlogontime": { "type": "date" },
                "privileglevel": { "type": "text" },
                "item_main": { "type": "text" },
                "date_main": { "type": "date" },
                "type_main": { "type": "keyword" },
                "etc_main": { "type": "text" }
            }
        }
    }
}
'