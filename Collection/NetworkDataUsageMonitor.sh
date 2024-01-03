#! /usr/bin/env bash
elasticPrefix=$1

curl -X PUT "http://192.168.190.121:9200/${elasticPrefix}_networkdatausagemonitor?pretty" -H 'Content-Type: application/json' -d'
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
                "record_id": { "type": "integer" },
                "app_name": { "type": "text", "analyzer": "custom_analyzer"},
                "app_id": { "type": "integer" },
                "user_name": { "type": "text", "analyzer": "custom_analyzer"},
                "user_sid": { "type": "text", "analyzer": "custom_analyzer"},
                "bytes_sent": { "type": "integer" },
                "bytes_recvd": { "type": "long" },
                "network_adapter": { "type": "text", "analyzer": "custom_analyzer"},
                "network_adapter_guid": { "type": "text", "analyzer": "custom_analyzer"},
                "interfaceluid": { "type": "text", "analyzer": "custom_analyzer"},
                "timestamp": { "type": "date" },
                "item_main": { "type": "text", "analyzer": "custom_analyzer"},
                "date_main": { "type": "date" },
                "type_main": { "type": "text", "analyzer": "custom_analyzer"},
                "etc_main": { "type": "text", "analyzer": "custom_analyzer"}
            }
        }
    }
}
'