#! /usr/bin/env bash
elasticPrefix=$1

curl -X PUT "http://192.168.200.190:9200/${elasticPrefix}_memory_tree?pretty" -H 'Content-Type: application/json' -d'
{
  "settings": {
    "number_of_shards": 1,
    "number_of_replicas": 0,
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
                "uuid": { "type": "keyword"},
                "agent": { "type": "keyword"},
                "agentIP": { "type": "text", "fielddata": true},
                "agentName": { "type": "text", "analyzer": "custom_analyzer"},
                "processId": { "type": "integer"},
                "parentProcessId": { "type": "integer"},      
                "processName": { "type": "text", "analyzer": "custom_analyzer", "fielddata": true},
                "processCreateTime": { "type": "date"},
                "parentProcessName": { "type": "text", "analyzer": "custom_analyzer"},
                "parentProcessCreateTime": { "type": "date"},
                "processPath": { "type": "text", "analyzer": "custom_analyzer"},
                "userName": { "type": "text", "analyzer": "custom_analyzer"},
                "isPacked": { "type": "boolean"},
                "dynamicCommand": { "type": "text", "analyzer": "custom_analyzer"},
                "isHide": { "type": "boolean"},
                "item_main": { "type": "text", "analyzer": "custom_analyzer"},
                "date_main": { "type": "date"},
                "type_main": { "type": "text", "analyzer": "custom_analyzer"},
                "etc_main": { "type": "text", "analyzer": "custom_analyzer"},
                "task_id": { "type": "keyword" }
            }
        }
    }
}
'