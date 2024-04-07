#! /usr/bin/env bash
elasticPrefix=$1

curl -X PUT "http://192.168.190.121:9200/${elasticPrefix}_memory_network?pretty" -H 'Content-Type: application/json' -d'
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
                "agentIP": { "type": "text", "analyzer": "custom_analyzer", "fielddata": true },
                "agentName": { "type": "text", "analyzer": "custom_analyzer" },
                "item_main": { "type": "text", "analyzer": "custom_analyzer" },
                "date_main": { "type": "date" },
                "type_main": { "type": "text", "analyzer": "custom_analyzer" },
                "etc_main": { "type": "text", "analyzer": "custom_analyzer" },
                "task_id": { "type": "keyword" },
                "agentPort": { "type": "integer" },
                "agentCountry": { "type": "keyword" },
                "agentLongitude": { "type": "integer" },
                "agentLatitude": { "type": "integer" },
                "processId": { "type": "integer" },
                "processCreateTime": { "type": "date" },
                "timestamp": { "type": "date" },
                "srcAddress": { "type": "text" },
                "srcPort": { "type": "integer" },
                "dstAddress": { "type": "text" },
                "dstPort": { "type": "integer" },
                "action": { "type": "text", "analyzer": "custom_analyzer" },
                "otherIP":  { "type": "text", "analyzer": "custom_analyzer", "fielddata": true },
                "otherPort": { "type": "integer" },
                "otherCountry": { "type": "keyword" },
                "otherLongitude": { "type": "integer" },
                "otherLatitude": { "type": "integer" },
                "connectionInOrOut": { "type": "keyword" },
                "mode": { "type": "keyword" },
                "malicious": { "type": "integer" },
                "virusTotal": { "type": "integer" }
            }
        }
    }
}
'