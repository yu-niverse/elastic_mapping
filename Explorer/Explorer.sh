#! /usr/bin/env bash
elasticPrefix=$1

curl -X PUT "${elastic_url}/${elasticPrefix}_explorer?pretty" -H 'Content-Type: application/json' -d'
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
                "uuid": { "type": "keyword" },
                "agent": { "type": "keyword" },
                "agentIP": { "type": "ip" },
                "agentName": { "type": "text", "analyzer": "custom_analyzer"},
                "fileName": { "type": "text", "analyzer": "custom_analyzer"},
                "isDeleted": { "type": "boolean" },
                "isDirectory": { "type": "boolean" },
                "createTime": { "type": "date" },
                "writeTime": { "type": "date" },
                "accessTime": { "type": "date" },
                "entryModifiedTime": { "type": "date" },
                "dataLen": { "type": "long" },
                "path": { "type": "text", "analyzer": "custom_analyzer"},
                "disk": { "type": "text", "analyzer": "custom_analyzer"},
                "md5_sig": { "type": "text", "analyzer": "custom_analyzer"},
                "yaraRuleHitCount" : { "type": "integer" },
                "yaraRuleHit": { "type": "text", "analyzer": "custom_analyzer"},
                "item_main": { "type": "text", "analyzer": "custom_analyzer"},
                "date_main": { "type": "date" },
                "type_main": { "type": "text", "analyzer": "custom_analyzer"},
                "etc_main": { "type": "text", "analyzer": "custom_analyzer"},
                "task_id": { "type": "keyword" }
            }
        }
    }
}
'