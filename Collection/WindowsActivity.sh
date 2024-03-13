#! /usr/bin/env bash
elastic_url=$1

curl -X PUT "${elastic_url}/ed_windowsactivity?pretty" -H 'Content-Type: application/json' -d'
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
                "user_name": { "type": "text", "analyzer": "custom_analyzer"},
                "app_id": { "type": "text", "analyzer": "custom_analyzer"},
                "app_activity_id": { "type": "text", "analyzer": "custom_analyzer"},
                "activity_type": { "type": "text", "analyzer": "custom_analyzer"},
                "activity_status": { "type": "text", "analyzer": "custom_analyzer"},
                "tag": { "type": "text", "analyzer": "custom_analyzer"},
                "group": { "type": "text", "analyzer": "custom_analyzer"},
                "priority": { "type": "integer" },
                "is_local_only": { "type": "boolean" },
                "etag": { "type": "integer" },
                "created_in_cloud": { "type": "date" },
                "last_modified_time": { "type": "date" },
                "expiration_time": { "type": "date" },
                "start_time": { "type": "date" },
                "end_time": { "type": "date" },
                "last_modified_on_client": { "type": "date" },
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