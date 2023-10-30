#! /usr/bin/env bash
elasticPrefix=$1

curl -X PUT "http://ela-master.ed.qa:9200/${elasticPrefix}_installedsoftware?pretty" -H 'Content-Type: application/json' -d'
{
  "settings": {
    "number_of_shards": 1,
    "number_of_replicas": 1,
    "analysis": {
      "char_filter": {
        "replace_special": {
          "type": "mapping",
          "mappings": [
						"\"=>_doublequotes_",
						"\\\\=>_backslash_",
						"/=>_slash_",
						"(=>_leftParentheses_",
						")=>_rightParentheses_",
						"[=>_leftBracket_",
						"]=>_rightBracket_",
						"*=>_asterisks_",
						"?=>_question_",
						"!=>_exclamation_",
						":=>_colon_",
						"+=>_plus_",
						"-=>_minus_",
						"~=>_tilde_",
						"^=>_caret_",
						"@=>_at_",
						"==>_equal_",
						">=>_moreThan_",
						"<=>_lessThan_",
						";=>_semicolon_",
						"{=>_rightBrace_",
						"}=>_leftBrace_",
						"&=>_and_",
						"|=>_pipe_",
						"%=>_percent_"
				]
        }
      },
      "analyzer": {
        "custom_analyzer": {
          "type": "custom",
          "tokenizer": "whitespace",
          "char_filter": ["replace_special"],
          "filter": "lowercase"
        }
      }
    }
  },
    "mappings": {
        "_doc": {
            "dynamic": "strict",
            "properties": {
                "uuid": { "type": "keyword" },
                "agent": { "type": "keyword" },
                "agentIP": { "type": "ip" },
                "agentName": { "type": "text", "analyzer": "custom_analyzer"},
                "displayname": { "type": "text", "analyzer": "custom_analyzer"},
                "registryname": { "type": "text", "analyzer": "custom_analyzer"},
                "displayversion": { "type": "text", "analyzer": "custom_analyzer"},
                "installdate": { "type": "date" },
                "installedfor": { "type": "text", "analyzer": "custom_analyzer"},
                "installlocation": { "type": "text", "analyzer": "custom_analyzer"},
                "publisher": { "type": "text", "analyzer": "custom_analyzer"},
                "uninstallstring": { "type": "text", "analyzer": "custom_analyzer"},
                "modifypath": { "type": "text", "analyzer": "custom_analyzer"},
                "comments": { "type": "text", "analyzer": "custom_analyzer"},
                "urlinfoabout": { "type": "text", "analyzer": "custom_analyzer"},
                "urlupdateinfo": { "type": "text", "analyzer": "custom_analyzer"},
                "helplink": { "type": "text", "analyzer": "custom_analyzer"},
                "installsource": { "type": "text", "analyzer": "custom_analyzer"},
                "releasetype": { "type": "text", "analyzer": "custom_analyzer"},
                "displayicon": { "type": "text", "analyzer": "custom_analyzer"},
                "estimatedsize": { "type": "integer" },
                "registrytime": { "type": "date" },
                "installfoldercreatedtime": { "type": "date" },
                "installfoldermodifiedtime": { "type": "date" },
                "item_main": { "type": "text", "analyzer": "custom_analyzer"},
                "date_main": { "type": "date" },
                "type_main": { "type": "text", "analyzer": "custom_analyzer"},
                "etc_main": { "type": "text", "analyzer": "custom_analyzer"}
            }
        }
    }
}
'