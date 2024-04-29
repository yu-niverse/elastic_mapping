#! /usr/bin/env bash
elastic_url=$1

curl -X PUT "${elastic_url}/ed_memory?pretty" -H 'Content-Type: application/json' -d'
{
  "settings": {
    "number_of_shards": 1,
    "number_of_replicas": 2,
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
            "dynamic": "strict",
            "properties": {
                "uuid": { "type": "keyword" },
                "agent": { "type": "keyword" },
                "agentIP": { "type": "text", "analyzer": "custom_analyzer", "fields": { "raw": { "type": "keyword" } } },
                "agentName": { "type": "text", "analyzer": "custom_analyzer", "fields": { "raw": { "type": "keyword" } } },
                "item_main": { "type": "text", "analyzer": "custom_analyzer" },
                "date_main": { "type": "date" },
                "type_main": { "type": "text", "analyzer": "custom_analyzer" },
                "etc_main": { "type": "text", "analyzer": "custom_analyzer" },
                "task_id": { "type": "keyword"  },
                "category": { "type": "keyword" },
                "memory": {
                  "properties": {
                      "processName": { "type": "text", "analyzer": "custom_analyzer", "fields": { "raw": { "type": "keyword" } } },
                      "processCreateTime": { "type": "date" },
                      "processConnectIP": { "type": "text", "analyzer": "custom_analyzer" },
                      "dynamicCommand": { "type": "text", "analyzer": "custom_analyzer" },
                      "processMD5": { "type": "text", "analyzer": "custom_analyzer" },
                      "processPath": { "type": "text", "analyzer": "custom_analyzer" },
                      "parentProcessId": { "type": "integer" },      
                      "parentProcessName": { "type": "text", "analyzer": "custom_analyzer" },
                      "parentProcessPath": { "type": "text", "analyzer": "custom_analyzer" },
                      "digitalSign": { "type": "text", "analyzer": "custom_analyzer" },
                      "importOtherDLL": { "type": "text", "analyzer": "custom_analyzer" },
                      "processId": { "type": "integer" },
                      "riskLevel": { "type": "integer" },
                      "riskScore" : { "type": "integer" },
                      "injectActive": { "type": "text", "analyzer": "custom_analyzer" },
                      "processBeInjected": { "type": "integer" },
                      "boot": { "type": "text", "analyzer": "custom_analyzer" },
                      "hook": { "type": "text", "analyzer": "custom_analyzer" },
                      "hide": { "type": "text", "analyzer": "custom_analyzer" },
                      "mode": { "type": "text", "analyzer": "custom_analyzer" },
                      "processKey": {"type": "keyword" },
                      "malicious": { "type": "integer"  },
                      "virusTotal": { "type": "integer" }
                  }
                },
                "memory_network": {
                  "properties": {
                    "agentPort": { "type": "integer", "fields": { "raw": { "type": "keyword" } } },
                    "agentCountry": { "type": "keyword" },
                    "agentLongitude": { "type": "integer" },
                    "agentLatitude": { "type": "integer" },
                    "processId": { "type": "integer", "fields": { "raw": { "type": "keyword" } } },
                    "processCreateTime": { "type": "date", "fields": { "raw": { "type": "keyword" } } },
                    "timestamp": { "type": "date", "fields": { "raw": { "type": "keyword" } } },
                    "srcAddress": { "type": "text", "fields": { "raw": { "type": "keyword" } } },
                    "srcPort": { "type": "integer", "fields": { "raw": { "type": "keyword" } } },
                    "dstAddress": { "type": "text", "fields": { "raw": { "type": "keyword" } } },
                    "dstPort": { "type": "integer", "fields": { "raw": { "type": "keyword" } } },
                    "action": { "type": "text", "analyzer": "custom_analyzer", "fields": { "raw": { "type": "keyword" } } },
                    "otherIP":  { "type": "text", "analyzer": "custom_analyzer", "fields": { "raw": { "type": "keyword" } } },
                    "otherPort": { "type": "integer", "fields": { "raw": { "type": "keyword" } } },
                    "otherCountry": { "type": "keyword" },
                    "otherLongitude": { "type": "integer" },
                    "otherLatitude": { "type": "integer" },
                    "connectionInOrOut": { "type": "keyword" },
                    "mode": { "type": "keyword" },
                    "malicious": { "type": "integer" },
                    "virusTotal": { "type": "integer", "fields": { "raw": { "type": "keyword" } } }
                  }
                },
                "memory_tree": {
                  "properties": {
                      "processId": { "type": "integer" },
                      "parentProcessId": { "type": "integer" },      
                      "processName": { "type": "text", "analyzer": "custom_analyzer", "fields": { "raw": { "type": "keyword" } } },
                      "processCreateTime": { "type": "date" },
                      "parentProcessName": { "type": "text", "analyzer": "custom_analyzer" },
                      "parentProcessCreateTime": { "type": "date" },
                      "processPath": { "type": "text", "analyzer": "custom_analyzer" },
                      "userName": { "type": "text", "analyzer": "custom_analyzer" },
                      "isPacked": { "type": "boolean" },
                      "dynamicCommand": { "type": "text", "analyzer": "custom_analyzer" },
                      "isHide": { "type": "boolean" },
                      "isRoot": { "type": "boolean" },
                      "child": { "type": "text", "analyzer": "custom_analyzer" }
                  }
                }
            }
    }
}'