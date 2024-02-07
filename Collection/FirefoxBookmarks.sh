#! /usr/bin/env bash
elasticPrefix=$1

curl -X PUT "http://172.16.1.25:9200/${elasticPrefix}_firefoxbookmarks?pretty" -H 'Content-Type: application/json' -d'
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
                "id": { "type": "integer" },
                "parent": { "type": "integer" },
                "type": { "type": "integer" },
                "title": { "type": "text", "analyzer": "custom_analyzer"},
                "dateadded": { "type": "date" },
                "lastmodified": { "type": "date" },
                "guid": { "type": "text", "analyzer": "custom_analyzer"},
                "syncstatus": { "type": "integer" },
                "url": { "type": "text", "analyzer": "custom_analyzer"},
                "url_title": { "type": "text", "analyzer": "custom_analyzer"},
                "rev_host": { "type": "text", "analyzer": "custom_analyzer"},
                "url_visit_count": { "type": "integer" },
                "url_last_visit_date": { "type": "date" },
                "url_guid": { "type": "text", "analyzer": "custom_analyzer"},
                "url_description": { "type": "text", "analyzer": "custom_analyzer"},
                "preview_image_url": { "type": "text", "analyzer": "custom_analyzer"},
                "item_main": { "type": "text", "analyzer": "custom_analyzer"},
                "date_main": { "type": "date" },
                "type_main": { "type": "text", "analyzer": "custom_analyzer"},
                "etc_main": { "type": "text", "analyzer": "custom_analyzer"}
            }
        }
    }
}
'