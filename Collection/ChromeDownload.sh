#! /usr/bin/env bash
elasticPrefix=$1

curl -X PUT "http://192.168.200.190:9200/${elasticPrefix}_chromedownload?pretty" -H 'Content-Type: application/json' -d'
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
                "download_url": { "type": "text", "analyzer": "custom_analyzer"},
                "guid": { "type": "text", "analyzer": "custom_analyzer"},
                "current_path": { "type": "text", "analyzer": "custom_analyzer"},
                "target_path": { "type": "text", "analyzer": "custom_analyzer"},
                "received_bytes": { "type": "long" },
                "total_bytes": { "type": "long" },
                "start_time": { "type": "date" },
                "end_time": { "type": "date" },
                "last_access_time": { "type": "date" },
                "danger": { "type": "text", "analyzer": "custom_analyzer"},
                "interrupt_reason": { "type": "text", "analyzer": "custom_analyzer"},
                "opened": { "type": "boolean" },
                "referrer": { "type": "text", "analyzer": "custom_analyzer"},
                "site_url": { "type": "text", "analyzer": "custom_analyzer"},
                "tab_url": { "type": "text", "analyzer": "custom_analyzer"},
                "tab_referrer_url": { "type": "text", "analyzer": "custom_analyzer"},
                "etag": { "type": "text", "analyzer": "custom_analyzer"},
                "last_modified": { "type": "date" },
                "mime_type": { "type": "text", "analyzer": "custom_analyzer"},
                "original_mime_type": { "type": "text", "analyzer": "custom_analyzer"},            
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