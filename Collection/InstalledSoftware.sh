#! /usr/bin/env bash
elasticPrefix=$1

curl -X PUT "http://ela-master.ed.qa:9200/${elasticPrefix}_installedsoftware?pretty" -H 'Content-Type: application/json' -d'
{
    "mappings": {
        "_doc": {
            "dynamic": "strict",
            "properties": {
                "uuid": { "type": "keyword" },
                "agent": { "type": "keyword" },
                "agentIP": { "type": "keyword" },
                "agentName": { "type": "keyword" },
                "displayname": { "type": "text" },
                "registryname": { "type": "text" },
                "displayversion": { "type": "text" },
                "installdate": { "type": "date" },
                "installedfor": { "type": "text" },
                "installlocation": { "type": "text" },
                "publisher": { "type": "text" },
                "uninstallstring": { "type": "text" },
                "modifypath": { "type": "text" },
                "comments": { "type": "text" },
                "urlinfoabout": { "type": "text" },
                "urlupdateinfo": { "type": "text" },
                "helplink": { "type": "text" },
                "installsource": { "type": "text" },
                "releasetype": { "type": "text" },
                "displayicon": { "type": "text" },
                "estimatedsize": { "type": "integer" },
                "registrytime": { "type": "date" },
                "installfoldercreatedtime": { "type": "date" },
                "installfoldermodifiedtime": { "type": "date" },
                "item_main": { "type": "text" },
                "date_main": { "type": "date" },
                "type_main": { "type": "keyword" },
                "etc_main": { "type": "text" }
            }
        }
    }
}
'