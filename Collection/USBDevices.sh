#! /usr/bin/env bash
elastic_url=$1

curl -X PUT "${elastic_url}/ed_usbdevices?pretty" -H 'Content-Type: application/json' -d'
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
                "device_instance_id": { "type": "text", "analyzer": "custom_analyzer"},
                "device_description": { "type": "text", "analyzer": "custom_analyzer"},
                "hardware_ids": { "type": "text", "analyzer": "custom_analyzer"},
                "bus_reported_device_description": { "type": "text", "analyzer": "custom_analyzer"},
                "device_manufacturer": { "type": "text", "analyzer": "custom_analyzer"},
                "device_friendly_name": { "type": "text", "analyzer": "custom_analyzer"},
                "device_location_info": { "type": "text", "analyzer": "custom_analyzer"},
                "device_security_descriptor_string": { "type": "text", "analyzer": "custom_analyzer"},
                "containerid": { "type": "text", "analyzer": "custom_analyzer"},
                "device_display_category": { "type": "text", "analyzer": "custom_analyzer"},
                "device_letter": { "type": "text", "analyzer": "custom_analyzer"},
                "enumerator": { "type": "text", "analyzer": "custom_analyzer"},
                "install_date": { "type": "date" },
                "first_install_date": { "type": "date" },
                "last_arrival_date": { "type": "date" },
                "last_removal_date": { "type": "date" },
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