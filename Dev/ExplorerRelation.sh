curl -X PUT "http://ela-master.ed.qa:9200/ed_de_explorer_relation?pretty" -H 'Content-Type: application/json' -d'
{
    "mappings": {
        "_doc": {
            "dynamic": "strict",
            "properties": {
                "agent": { "type": "keyword" },
                "isRoot": { "type": "boolean" },
                "parent": { "type": "keyword" },
                "child": { "type": "keyword" }
            }
        }
    }
}
'