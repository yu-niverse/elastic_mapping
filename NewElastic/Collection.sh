# ! /usr/bin/env bash
elasticPrefix=$1

curl -X PUT "http://35.76.121.49:9200/${elasticPrefix}_collection?pretty" -H 'Content-Type: application/json' -d'
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
    "_doc": {
      "dynamic": "strict",
      "properties": {
        "uuid": { "type": "keyword" },
        "agent": { "type": "keyword" },
        "agentIP": { "type": "text", "analyzer": "custom_analyzer" },
        "agentName": { "type": "text", "analyzer": "custom_analyzer" },
        "item_main": { "type": "text", "analyzer": "custom_analyzer" },
        "date_main": { "type": "date" },
        "type_main": { "type": "text", "analyzer": "custom_analyzer" },
        "etc_main": { "type": "text", "analyzer": "custom_analyzer" },
        "task_id": { "type": "keyword" },
        "category": { "type": "keyword" },
        "appresourceusagemonitor": {
          "properties": {
                "record_id": { "type": "integer" },
                "app_name": { "type": "text", "analyzer": "custom_analyzer" },
                "app_id": { "type": "integer" },
                "user_name": { "type": "text", "analyzer": "custom_analyzer" },
                "user_sid": { "type": "text", "analyzer": "custom_analyzer" },
                "foregroundcycletime": { "type": "long" },
                "backgroundcycletime": { "type": "long" },
                "facetime": { "type": "long" },
                "foregroundbytesread": { "type": "long" },
                "foregroundbyteswritten": { "type": "long" },
                "foregroundnumreadoperations": { "type": "long" },
                "foregroundnumwriteoperations": { "type": "long" },
                "foregroundnumberofflushes": { "type": "long" },
                "backgroundbytesread": { "type": "long" },
                "backgroundbyteswritten": { "type": "long" },
                "backgroundnumreadoperations": { "type": "long" },
                "backgroundnumwriteoperations": { "type": "long" },
                "backgroundnumberofflushes": { "type": "long" },
                "interfaceluid": { "type": "text", "analyzer": "custom_analyzer" },
                "timestamp": { "type": "date" }
          }
        },
        "arpcache": {
          "properties": {
                "interface": { "type": "text", "analyzer": "custom_analyzer" },
                "internetaddress": { "type": "text", "analyzer": "custom_analyzer" },
                "physicaladdress": { "type": "text", "analyzer": "custom_analyzer" },
                "type": { "type": "text", "analyzer": "custom_analyzer" }
          }
        },
        "baseservice": {
          "properties": {
                "name": { "type": "text", "analyzer": "custom_analyzer" },
                "caption": { "type": "text", "analyzer": "custom_analyzer" },
                "description": { "type": "text", "analyzer": "custom_analyzer" },
                "displayname": { "type": "text", "analyzer": "custom_analyzer" },
                "errorcontrol": { "type": "text", "analyzer": "custom_analyzer" },
                "pathname": { "type": "text", "analyzer": "custom_analyzer" },
                "creationclassname": { "type": "text", "analyzer": "custom_analyzer" },
                "servicetype": { "type": "text", "analyzer": "custom_analyzer" },
                "started": { "type": "text", "analyzer": "custom_analyzer" },
                "startmode": { "type": "text", "analyzer": "custom_analyzer" },
                "startname": { "type": "text", "analyzer": "custom_analyzer" },
                "state": { "type": "text", "analyzer": "custom_analyzer" },
                "status": { "type": "text", "analyzer": "custom_analyzer" },
                "systemname": { "type": "text", "analyzer": "custom_analyzer" },
                "acceptpause": { "type": "boolean" },
                "acceptstop": { "type": "boolean" }
          }
        },
        "chromebookmarks": {
          "properties": {
                "id": { "type": "integer" },
                "parent": { "type": "integer" },
                "type": { "type": "text", "analyzer": "custom_analyzer" },
                "name": { "type": "text", "analyzer": "custom_analyzer" },
                "url": { "type": "text", "analyzer": "custom_analyzer" },
                "guid": { "type": "text", "analyzer": "custom_analyzer" },
                "date_added": { "type": "date" },
                "date_modified": { "type": "date" }
          }
        },
        "chromecache": {
          "properties": {
                "id": { "type": "integer" },
                "url": { "type": "text", "analyzer": "custom_analyzer" },
                "web_site": { "type": "text", "analyzer": "custom_analyzer" },
                "frame": { "type": "text", "analyzer": "custom_analyzer" },
                "cache_control": { "type": "text", "analyzer": "custom_analyzer" },
                "content_encoding": { "type": "text", "analyzer": "custom_analyzer" },
                "content_length": { "type": "long" },
                "content_type": { "type": "text", "analyzer": "custom_analyzer" },
                "date": { "type": "date" },
                "expires": { "type": "date" },
                "last_modified": { "type": "date" },
                "server": { "type": "text", "analyzer": "custom_analyzer" },
                "usage_counter": { "type": "long" },
                "reuse_counter": { "type": "long" }
          }
        },
        "chromecookies": {
          "properties": {
                "id": { "type": "integer" },
                "creation_utc": { "type": "date" },
                "host_key": { "type": "text", "analyzer": "custom_analyzer" },
                "name": { "type": "text", "analyzer": "custom_analyzer" },
                "value": { "type": "text", "analyzer": "custom_analyzer" },
                "encrypted_value": { "type": "text", "analyzer": "custom_analyzer" },
                "expires_utc": { "type": "date" },
                "last_access_utc": { "type": "date" },
                "source_port": { "type": "integer" }
          }
        },
        "chromedownload": {
          "properties": {
                "download_url": { "type": "text", "analyzer": "custom_analyzer" },
                "guid": { "type": "text", "analyzer": "custom_analyzer" },
                "current_path": { "type": "text", "analyzer": "custom_analyzer" },
                "target_path": { "type": "text", "analyzer": "custom_analyzer" },
                "received_bytes": { "type": "long" },
                "total_bytes": { "type": "long" },
                "start_time": { "type": "date" },
                "end_time": { "type": "date" },
                "last_access_time": { "type": "date" },
                "danger": { "type": "text", "analyzer": "custom_analyzer" },
                "interrupt_reason": { "type": "text", "analyzer": "custom_analyzer" },
                "opened": { "type": "boolean" },
                "referrer": { "type": "text", "analyzer": "custom_analyzer" },
                "site_url": { "type": "text", "analyzer": "custom_analyzer" },
                "tab_url": { "type": "text", "analyzer": "custom_analyzer" },
                "tab_referrer_url": { "type": "text", "analyzer": "custom_analyzer" },
                "etag": { "type": "text", "analyzer": "custom_analyzer" },
                "last_modified": { "type": "date" },
                "mime_type": { "type": "text", "analyzer": "custom_analyzer" },
                "original_mime_type": { "type": "text", "analyzer": "custom_analyzer" }
          }
        },
        "chromehistory": {
          "properties": {
                "url": { "type": "text", "analyzer": "custom_analyzer" },
                "title": { "type": "text", "analyzer": "custom_analyzer" },
                "visit_time": { "type": "date" },
                "visit_count": { "type": "long" },
                "last_visit_time": { "type": "date" }
          }
        },
        "chromekeywordsearch": {
          "properties": {
                "term": { "type": "text", "analyzer": "custom_analyzer" },
                "title": { "type": "text", "analyzer": "custom_analyzer" },
                "url": { "type": "text", "analyzer": "custom_analyzer" }
          }
        },
        "chromelogin": {
          "properties": {
                "origin_url": { "type": "text", "analyzer": "custom_analyzer" },
                "action_url": { "type": "text", "analyzer": "custom_analyzer" },
                "username_element": { "type": "text", "analyzer": "custom_analyzer" },
                "username_value": { "type": "text", "analyzer": "custom_analyzer" },
                "date_created": { "type": "date" }
          }
        },
        "dnsinfo": {
          "properties": {
                "timetolive": { "type": "long" },
                "pscomputername": { "type": "text", "analyzer": "custom_analyzer" },
                "caption": { "type": "text", "analyzer": "custom_analyzer" },
                "description": { "type": "text", "analyzer": "custom_analyzer" },
                "elementname": { "type": "text", "analyzer": "custom_analyzer" },
                "instanceid": { "type": "integer" },
                "data": { "type": "text", "analyzer": "custom_analyzer" },
                "datalength": { "type": "long" },
                "entry": { "type": "text", "analyzer": "custom_analyzer" },
                "name": { "type": "text", "analyzer": "custom_analyzer" },
                "section": { "type": "integer" },
                "status": { "type": "integer" },
                "type": { "type": "integer" }
          }
        },
        "edgebookmarks": {
          "properties": {
                "id": { "type": "integer" },
                "parent": { "type": "integer" },
                "type": { "type": "text", "analyzer": "custom_analyzer" },
                "name": { "type": "text", "analyzer": "custom_analyzer" },
                "url": { "type": "text", "analyzer": "custom_analyzer" },
                "source": { "type": "text", "analyzer": "custom_analyzer" },
                "guid": { "type": "text", "analyzer": "custom_analyzer" },
                "date_added": { "type": "date" },
                "date_modified": { "type": "date" }
          }
        },
        "edgecache": {
          "properties": {
                "id": { "type": "integer" },
                "url": { "type": "text", "analyzer": "custom_analyzer" },
                "web_site": { "type": "text", "analyzer": "custom_analyzer" },
                "frame": { "type": "text", "analyzer": "custom_analyzer" },
                "cache_control": { "type": "text", "analyzer": "custom_analyzer" },
                "content_encoding": { "type": "text", "analyzer": "custom_analyzer" },
                "content_length": { "type": "long" },
                "content_type": { "type": "text", "analyzer": "custom_analyzer" },
                "date": { "type": "date" },
                "expires": { "type": "date" },
                "last_modified": { "type": "date" },
                "server": { "type": "text", "analyzer": "custom_analyzer" },
                "usage_counter": { "type": "long" },
                "reuse_counter": { "type": "long" }
          }
        },
        "edgecookies": {
          "properties": {
                "id": { "type": "integer" },
                "creation_utc": { "type": "date" },
                "host_key": { "type": "text", "analyzer": "custom_analyzer" },
                "name": { "type": "text", "analyzer": "custom_analyzer" },
                "value": { "type": "text", "analyzer": "custom_analyzer" },
                "encrypted_value": { "type": "text", "analyzer": "custom_analyzer" },
                "expires_utc": { "type": "date" },
                "last_access_utc": { "type": "date" },
                "source_port": { "type": "integer" }
          }
        },
        "edgehistory": {
          "properties": {
                "id": { "type": "integer" },
                "url": { "type": "text", "analyzer": "custom_analyzer" },
                "title": { "type": "text", "analyzer": "custom_analyzer" },
                "visit_time": { "type": "date" },
                "visit_count": { "type": "long" },
                "last_visit_time": { "type": "date" }
          }
        },
        "edgelogin": {
          "properties": {
                "id": { "type": "integer" },
                "origin_url": { "type": "text", "analyzer": "custom_analyzer" },
                "action_url": { "type": "text", "analyzer": "custom_analyzer" },
                "username_element": { "type": "text", "analyzer": "custom_analyzer" },
                "username_value": { "type": "text", "analyzer": "custom_analyzer" },
                "date_created": { "type": "date" }
          }
        },
        "email": {
          "properties": {
                "id": { "type": "integer" }, 
                "from": { "type": "text", "analyzer": "custom_analyzer" },
                "to": { "type": "text", "analyzer": "custom_analyzer" }, 
                "sent_representing_name": { "type": "text", "analyzer": "custom_analyzer" },
                "type": { "type": "text", "analyzer": "custom_analyzer" },
        				"delivery_time": { "type": "date" }, 
                "creation_time": { "type": "date" },
                "importance": { "type": "text", "analyzer": "custom_analyzer" },
                "received": { "type": "text", "analyzer": "custom_analyzer" },
                "subject": { "type": "text", "analyzer": "custom_analyzer" },
                "message_ID": { "type": "text", "analyzer": "custom_analyzer" },
                "message": { "type": "text", "analyzer": "custom_analyzer" }
          }
        },
        "emailpath": {
          "properties": {
                "id": { "type": "integer" },
                "path": { "type": "text", "analyzer": "custom_analyzer" }
          }
        },
        "eventapplication": {
          "properties": {
                "eventrecordid": { "type": "integer" },
                "providername": { "type": "text", "analyzer": "custom_analyzer" },
                "providerguid": { "type": "text", "analyzer": "custom_analyzer" },
                "eventid": { "type": "long" },
                "version": { "type": "integer" },
                "level": { "type": "text", "analyzer": "custom_analyzer" },
                "keywords": { "type": "text", "analyzer": "custom_analyzer" },
                "task": { "type": "integer" },
                "opcode": { "type": "integer" },
                "createdsystemtime": { "type": "date" },
                "correlationactivityid": { "type": "text", "analyzer": "custom_analyzer" },
                "correlationrelatedactivityid": { "type": "text", "analyzer": "custom_analyzer" },
                "executionprocessid": { "type": "integer" },
                "executionthreadid": { "type": "integer" },
                "channel": { "type": "text", "analyzer": "custom_analyzer" },
                "computer": { "type": "text", "analyzer": "custom_analyzer" },
                "securityuserid": { "type": "text", "analyzer": "custom_analyzer" },
                "evtrenderdata": { "type": "text", "analyzer": "custom_analyzer" }
          }
        },
        "eventsecurity": {
          "properties": {
                "eventrecordid": { "type": "integer" },
                "providername": { "type": "text", "analyzer": "custom_analyzer" },
                "providerguid": { "type": "text", "analyzer": "custom_analyzer" },
                "eventid": { "type": "long" },
                "version": { "type": "integer" },
                "level": { "type": "text", "analyzer": "custom_analyzer" },
                "keywords": { "type": "text", "analyzer": "custom_analyzer" },
                "task": { "type": "integer" },
                "opcode": { "type": "integer" },
                "createdsystemtime": { "type": "date" },
                "correlationactivityid": { "type": "text", "analyzer": "custom_analyzer" },
                "correlationrelatedactivityid": { "type": "text", "analyzer": "custom_analyzer" },
                "executionprocessid": { "type": "integer" },
                "executionthreadid": { "type": "integer" },
                "channel": { "type": "text", "analyzer": "custom_analyzer" },
                "computer": { "type": "text", "analyzer": "custom_analyzer" },
                "securityuserid": { "type": "text", "analyzer": "custom_analyzer" },
                "evtrenderdata": { "type": "text", "analyzer": "custom_analyzer" }
          }
        },
        "eventsystem": {
          "properties": {
                "eventrecordid": { "type": "integer" },
                "providername": { "type": "text", "analyzer": "custom_analyzer" },
                "providerguid": { "type": "text", "analyzer": "custom_analyzer" },
                "eventid": { "type": "long" },
                "version": { "type": "integer" },
                "level": { "type": "text", "analyzer": "custom_analyzer" },
                "keywords": { "type": "text", "analyzer": "custom_analyzer" },
                "task": { "type": "integer" },
                "opcode": { "type": "integer" },
                "createdsystemtime": { "type": "date" },
                "correlationactivityid": { "type": "text", "analyzer": "custom_analyzer" },
                "correlationrelatedactivityid": { "type": "text", "analyzer": "custom_analyzer" },
                "executionprocessid": { "type": "integer" },
                "executionthreadid": { "type": "integer" },
                "channel": { "type": "text", "analyzer": "custom_analyzer" },
                "computer": { "type": "text", "analyzer": "custom_analyzer" },
                "securityuserid": { "type": "text", "analyzer": "custom_analyzer" },
                "evtrenderdata": { "type": "text", "analyzer": "custom_analyzer" }
          }
        },
        "firefoxbookmarks": {
          "properties": {
                "id": { "type": "integer" },
                "parent": { "type": "integer" },
                "type": { "type": "integer" },
                "title": { "type": "text", "analyzer": "custom_analyzer" },
                "dateadded": { "type": "date" },
                "lastmodified": { "type": "date" },
                "guid": { "type": "text", "analyzer": "custom_analyzer" },
                "syncstatus": { "type": "integer" },
                "url": { "type": "text", "analyzer": "custom_analyzer" },
                "url_title": { "type": "text", "analyzer": "custom_analyzer" },
                "rev_host": { "type": "text", "analyzer": "custom_analyzer" },
                "url_visit_count": { "type": "long" },
                "url_last_visit_date": { "type": "date" },
                "url_guid": { "type": "text", "analyzer": "custom_analyzer" },
                "url_description": { "type": "text", "analyzer": "custom_analyzer" },
                "preview_image_url": { "type": "text", "analyzer": "custom_analyzer" }
          }
        },
        "firefoxcache": {
          "properties": {
                "id": { "type": "integer" },
                "url": { "type": "text", "analyzer": "custom_analyzer" },
                "server_response": { "type": "text", "analyzer": "custom_analyzer" },
                "server_name": { "type": "text", "analyzer": "custom_analyzer" },
                "cache_control": { "type": "text", "analyzer": "custom_analyzer" },
                "content_encoding": { "type": "text", "analyzer": "custom_analyzer" },
                "content_length": { "type": "long" },
                "content_type": { "type": "text", "analyzer": "custom_analyzer" },
                "fetch_count": { "type": "long" },
                "last_fetched": { "type": "date" },
                "last_modified": { "type": "date" },
                "frequency": { "type": "integer" },
                "expiration": { "type": "date" }
          }
        },
        "firefoxcookies": {
          "properties": {
                "id": { "type": "integer" },
                "name": { "type": "text", "analyzer": "custom_analyzer" },
                "value": { "type": "text", "analyzer": "custom_analyzer" },
                "host": { "type": "text", "analyzer": "custom_analyzer" },
                "path": { "type": "text", "analyzer": "custom_analyzer" },
                "lastaccessed": { "type": "date" },
                "creationtime": { "type": "date" }
          }
        },
        "firefoxhistory": {
          "properties": {
                "url": { "type": "text", "analyzer": "custom_analyzer" },
                "title": { "type": "text", "analyzer": "custom_analyzer" },
                "from_url": { "type": "text", "analyzer": "custom_analyzer" },
                "rev_host": { "type": "text", "analyzer": "custom_analyzer" },
                "guid": { "type": "text", "analyzer": "custom_analyzer" },
                "description": { "type": "text", "analyzer": "custom_analyzer" },
                "preview_image_url": { "type": "text", "analyzer": "custom_analyzer" },
                "visit_count": { "type": "long" },
                "visit_date": { "type": "date" },
                "last_visit_date": { "type": "date" }
          }
        },
        "firefoxlogin": {
          "properties": {
                "hostname": { "type": "text", "analyzer": "custom_analyzer" },
                "username": { "type": "text", "analyzer": "custom_analyzer" },
                "password": { "type": "text", "analyzer": "custom_analyzer" },
                "timecreated": { "type": "date" }, 
                "timelastused": { "type": "date" }, 
                "timepasswordchanged": { "type": "date" }
          }
        },
        "iecache": {
          "properties": {
                "sourceurlname": { "type": "text", "analyzer": "custom_analyzer" },
                "localfilename": { "type": "text", "analyzer": "custom_analyzer" },
                "expirestime": { "type": "date" },
                "lastaccesstime": { "type": "date" },
                "lastmodifiedtime": { "type": "date" },
                "lastsynctime": { "type": "date" }
          }
        },
        "iehistory": {
          "properties": {
                "url": { "type": "text", "analyzer": "custom_analyzer" },
                "title": { "type": "text", "analyzer": "custom_analyzer" },
                "expirestime": { "type": "date" },
                "lastupdatedtime": { "type": "date" },
                "visitedtime": { "type": "date" }
          }
        },
        "ielogin": {
          "properties": {
                "id": { "type": "integer" }, 
                "url": { "type": "text", "analyzer": "custom_analyzer" },
                "username": { "type": "text", "analyzer": "custom_analyzer" },
                "password": { "type": "text", "analyzer": "custom_analyzer" },
                "last_written": { "type": "date" }
          }
        },
        "installedsoftware": {
          "properties": {
                "displayname": { "type": "text", "analyzer": "custom_analyzer" },
                "registryname": { "type": "text", "analyzer": "custom_analyzer" },
                "displayversion": { "type": "text", "analyzer": "custom_analyzer" },
                "installdate": { "type": "date" },
                "installedfor": { "type": "text", "analyzer": "custom_analyzer" },
                "installlocation": { "type": "text", "analyzer": "custom_analyzer" },
                "publisher": { "type": "text", "analyzer": "custom_analyzer" },
                "uninstallstring": { "type": "text", "analyzer": "custom_analyzer" },
                "modifypath": { "type": "text", "analyzer": "custom_analyzer" },
                "comments": { "type": "text", "analyzer": "custom_analyzer" },
                "urlinfoabout": { "type": "text", "analyzer": "custom_analyzer" },
                "urlupdateinfo": { "type": "text", "analyzer": "custom_analyzer" },
                "helplink": { "type": "text", "analyzer": "custom_analyzer" },
                "installsource": { "type": "text", "analyzer": "custom_analyzer" },
                "releasetype": { "type": "text", "analyzer": "custom_analyzer" },
                "displayicon": { "type": "text", "analyzer": "custom_analyzer" },
                "estimatedsize": { "type": "long" },
                "registrytime": { "type": "date" },
                "installfoldercreatedtime": { "type": "date" },
                "installfoldermodifiedtime": { "type": "date" }
          }
        },
        "jumplist": {
          "properties": {
                "fullpath": { "type": "text", "analyzer": "custom_analyzer" },
                "application_id": { "type": "text", "analyzer": "custom_analyzer" },
                "computer_name": { "type": "text", "analyzer": "custom_analyzer" },
                "filesize": { "type": "long" },
                "entry_id": { "type": "integer" },
                "recordtime": { "type": "date" },
                "createtime": { "type": "date" },
                "accesstime": { "type": "date" },
                "modifiedtime": { "type": "date" }
          }
        },
        "muicache": {
          "properties": {
                "applicationpath": { "type": "text", "analyzer": "custom_analyzer" },
                "applicationname": { "type": "text", "analyzer": "custom_analyzer" }
          }
        },
        "netadapters": {
          "properties": {
                "description": { "type": "text", "analyzer": "custom_analyzer" },
                "type": { "type": "text", "analyzer": "custom_analyzer" },
                "mac": { "type": "text", "analyzer": "custom_analyzer" },
                "ip": { "type": "text", "analyzer": "custom_analyzer" }, 
                "subnet_mask": { "type": "text", "analyzer": "custom_analyzer" },
                "gateway": { "type": "text", "analyzer": "custom_analyzer" },
				        "dhcp_enabled" : { "type": "integer" },
                "dhcp_server": { "type": "text", "analyzer": "custom_analyzer" }, 
                "ddns_enabled" : { "type": "integer" },
                "dns_server": { "type": "text", "analyzer": "custom_analyzer" },
                "lease_lifetime" : { "type": "date" },
                "valid_lifetime": { "type": "date" }
          }
        },
        "network": {
          "properties": {
                "processid": { "type": "integer" },
                "processname": { "type": "text", "analyzer": "custom_analyzer" },
                "localaddress": { "type": "text", "analyzer": "custom_analyzer" },
                "localport": { "type": "integer" },
                "remoteaddress": { "type": "text", "analyzer": "custom_analyzer" },
                "remoteport": { "type": "integer" },
                "state": { "type": "text", "analyzer": "custom_analyzer" },
                "remotehostname": { "type": "text", "analyzer": "custom_analyzer" },
                "protocol": { "type": "text", "analyzer": "custom_analyzer" }
          }
        },
        "networkdatausagemonitor": {
          "properties": {
                "record_id": { "type": "integer" },
                "app_name": { "type": "text", "analyzer": "custom_analyzer" },
                "app_id": { "type": "integer" },
                "user_name": { "type": "text", "analyzer": "custom_analyzer" },
                "user_sid": { "type": "text", "analyzer": "custom_analyzer" },
                "bytes_sent": { "type": "long" },
                "bytes_recvd": { "type": "long" },
                "network_adapter": { "type": "text", "analyzer": "custom_analyzer" },
                "network_adapter_guid": { "type": "text", "analyzer": "custom_analyzer" },
                "interfaceluid": { "type": "text", "analyzer": "custom_analyzer" },
                "timestamp": { "type": "date" }
          }
        },
        "networkresources": {
          "properties": {
                "resourcesname": { "type": "text", "analyzer": "custom_analyzer" },
                "resourcestype": { "type": "text", "analyzer": "custom_analyzer" },
                "comment": { "type": "text", "analyzer": "custom_analyzer" },
                "localpath": { "type": "text", "analyzer": "custom_analyzer" },
                "provider": { "type": "text", "analyzer": "custom_analyzer" },
                "scope": { "type": "text", "analyzer": "custom_analyzer" },
                "displaytype": { "type": "text", "analyzer": "custom_analyzer" },
                "usage": { "type": "text", "analyzer": "custom_analyzer" },
                "ipaddress": { "type": "text", "analyzer": "custom_analyzer" }
          }
        },
        "openedfiles": {
          "properties": {
                "processid": {"type": "integer" },
                "processname": {"type": "text", "analyzer": "custom_analyzer" },
                "type": {"type": "text", "analyzer": "custom_analyzer" },
                "objectname": {"type": "text", "analyzer": "custom_analyzer" }
          }
        },
        "prefetch": {
          "properties": {
                "filename": {"type": "text", "analyzer": "custom_analyzer" },
                "processname": {"type": "text", "analyzer": "custom_analyzer" },
                "lastruntime": {"type": "date" },
                "processpath": {"type": "text", "analyzer": "custom_analyzer" },
                "runcount": {"type": "long" },
                "filesize": {"type": "long" },
                "foldercreatedtime": {"type": "date" },
                "foldermodifiedtime": {"type": "date" }
          }
        },
        "process": {
          "properties": {
                "pid": { "type": "integer" },
                "process_name": { "type": "text", "analyzer": "custom_analyzer" },
                "parent_pid": { "type": "integer" },
                "processcreatetime": { "type": "date" },
                "process_path": { "type": "text", "analyzer": "custom_analyzer" },
                "process_command": { "type": "text", "analyzer": "custom_analyzer" },
                "user_name": { "type": "text", "analyzer": "custom_analyzer" },
                "digitalsignature": { "type": "text", "analyzer": "custom_analyzer" },
                "productname": { "type": "text", "analyzer": "custom_analyzer" },
                "fileversion": { "type": "text", "analyzer": "custom_analyzer" },
                "filedescription": { "type": "text", "analyzer": "custom_analyzer" },
                "companyname": { "type": "text", "analyzer": "custom_analyzer" },
                "priority": { "type": "text", "analyzer": "custom_analyzer" },
                "processMD5": { "type": "text", "analyzer": "custom_analyzer" },
                "parentProcessName": { "type": "text", "analyzer": "custom_analyzer" },
                "parentProcessPath": { "type": "text", "analyzer": "custom_analyzer" },
                "injectActive": { "type": "text", "analyzer": "custom_analyzer" },
                "processBeInjected": { "type": "integer" },
                "boot": { "type": "text", "analyzer": "custom_analyzer" },
                "hide": { "type": "text", "analyzer": "custom_analyzer" },
                "importOtherDLL": { "type": "text", "analyzer": "custom_analyzer" },
                "hook": { "type": "text", "analyzer": "custom_analyzer" },
                "processConnectIP": { "type": "text", "analyzer": "custom_analyzer" }
          }
        },
        "recentfile": {
          "properties": {
                "fullpath": { "type": "text", "analyzer": "custom_analyzer" },
                "sourcepath": { "type": "text", "analyzer": "custom_analyzer" },
                "name": { "type": "text", "analyzer": "custom_analyzer" },
                "storedin": { "type": "text", "analyzer": "custom_analyzer" },
                "extension": { "type": "text", "analyzer": "custom_analyzer" },
                "ismissing": { "type": "text", "analyzer": "custom_analyzer" },
						    "createtime": { "type": "date" }, 
                "accesstime": { "type": "date" }, 
                "modifiedtime": { "type": "date" }
          }
        },
        "service": {
          "properties": {
                "name": { "type": "text", "analyzer": "custom_analyzer" },
                "caption": { "type": "text", "analyzer": "custom_analyzer" },
                "description": { "type": "text", "analyzer": "custom_analyzer" },
                "displayname": { "type": "text", "analyzer": "custom_analyzer" },
                "errorcontrol": { "type": "text", "analyzer": "custom_analyzer" },
                "pathname": { "type": "text", "analyzer": "custom_analyzer" },
                "processid": { "type": "integer" },
                "servicetype": { "type": "text", "analyzer": "custom_analyzer" },
                "started": { "type": "text", "analyzer": "custom_analyzer" },
                "startmode": { "type": "text", "analyzer": "custom_analyzer" },
                "startname": { "type": "text", "analyzer": "custom_analyzer" },
                "state": { "type": "text", "analyzer": "custom_analyzer" },
                "status": { "type": "text", "analyzer": "custom_analyzer" },
                "systemname": { "type": "text", "analyzer": "custom_analyzer" }
          }
        },
        "shellbags": {
          "properties": {
                "path": { "type": "text", "analyzer": "custom_analyzer" },
                "slotpath": { "type": "text", "analyzer": "custom_analyzer" },
                "slotnum": { "type": "long" },
                "lastmodifiedtime": { "type": "date" }, 
                "slotmodifiedtime": { "type": "date" }, 
                "createtime": { "type": "date" }, 
                "accesstime": { "type": "date" }
          }
        },
        "shortcuts": {
          "properties": {
                "shortcutname": { "type": "text", "analyzer": "custom_analyzer" },
                "linkpath": { "type": "text", "analyzer": "custom_analyzer" },
                "linkto": { "type": "text", "analyzer": "custom_analyzer" },
                "arguments": { "type": "text", "analyzer": "custom_analyzer" },
                "description": { "type": "text", "analyzer": "custom_analyzer" },
                "workingdirectory": { "type": "text", "analyzer": "custom_analyzer" },
                "iconlocation": { "type": "text", "analyzer": "custom_analyzer" },
                "brokenshortcut": { "type": "boolean" },
                "hotkey": { "type": "text", "analyzer": "custom_analyzer" },
                "showcmd": { "type": "text", "analyzer": "custom_analyzer" },
                "modifytime": { "type": "date" }
          }
        },
        "startrun": {
          "properties": {
                "name": { "type": "text", "analyzer": "custom_analyzer" },
                "command": { "type": "text", "analyzer": "custom_analyzer" },
                "user": { "type": "text", "analyzer": "custom_analyzer" },
                "location": { "type": "text", "analyzer": "custom_analyzer" },
                "caption": { "type": "text", "analyzer": "custom_analyzer" },
                "description": { "type": "text", "analyzer": "custom_analyzer" },
                "usersid": { "type": "text", "analyzer": "custom_analyzer" }
          }
        },
        "systeminfo": {
          "properties": {
                "bios": { "type": "text", "analyzer": "custom_analyzer" },
                "os": { "type": "text", "analyzer": "custom_analyzer" },
                "cpu": { "type": "text", "analyzer": "custom_analyzer" },
                "mb": { "type": "text", "analyzer": "custom_analyzer" }, 
                "ram": { "type": "text", "analyzer": "custom_analyzer" },
                "gpu": { "type": "text", "analyzer": "custom_analyzer" },
                "monitor": { "type": "text", "analyzer": "custom_analyzer" },
                "storage": { "type": "text", "analyzer": "custom_analyzer" },
                "cdrom": { "type": "text", "analyzer": "custom_analyzer" },
                "audio": { "type": "text", "analyzer": "custom_analyzer" },
                "externalip": { "type": "text", "analyzer": "custom_analyzer" },
                "networkadapters": { "type": "text", "analyzer": "custom_analyzer" },
                "uptime": { "type": "text", "analyzer": "custom_analyzer" },
                "hotfix": { "type": "text", "analyzer": "custom_analyzer" },
                "name": { "type": "text", "analyzer": "custom_analyzer" },
                "username": { "type": "text", "analyzer": "custom_analyzer" }
          }
        },
        "taskschedule": {
          "properties": {
                "name": { "type": "text", "analyzer": "custom_analyzer" },
                "path": { "type": "text", "analyzer": "custom_analyzer" },
                "command": { "type": "text", "analyzer": "custom_analyzer" },
                "lastruntime": { "type": "date" },
                "nextruntime": { "type": "date" },
                "startboundary": { "type": "long" },
                "endboundary": { "type": "long" }
          }
        },
        "usbdevices": {
          "properties": {
                "device_instance_id": { "type": "text", "analyzer": "custom_analyzer" },
                "device_description": { "type": "text", "analyzer": "custom_analyzer" },
                "hardware_ids": { "type": "text", "analyzer": "custom_analyzer" },
                "bus_reported_device_description": { "type": "text", "analyzer": "custom_analyzer" },
                "device_manufacturer": { "type": "text", "analyzer": "custom_analyzer" },
                "device_friendly_name": { "type": "text", "analyzer": "custom_analyzer" },
                "device_location_info": { "type": "text", "analyzer": "custom_analyzer" },
                "device_security_descriptor_string": { "type": "text", "analyzer": "custom_analyzer" },
                "containerid": { "type": "text", "analyzer": "custom_analyzer" },
                "device_display_category": { "type": "text", "analyzer": "custom_analyzer" },
                "device_letter": { "type": "text", "analyzer": "custom_analyzer" },
                "enumerator": { "type": "text", "analyzer": "custom_analyzer" },
                "install_date": { "type": "date" },
                "first_install_date": { "type": "date" },
                "last_arrival_date": { "type": "date" },
                "last_removal_date": { "type": "date" }
          }
        },
        "userassist": {
          "properties": {
                "name": { "type": "text", "analyzer": "custom_analyzer" },
                "classid": { "type": "text", "analyzer": "custom_analyzer" },
                "of_times_executed": { "type": "long" },
                "focus_count": { "type": "long" },
                "focus_time(s)": { "type": "long" },
                "modifiedtime": { "type": "date" }
          }
        },
        "userprofiles": {
          "properties": {
                "username": { "type": "text", "analyzer": "custom_analyzer" },
                "profilepath": { "type": "text", "analyzer": "custom_analyzer" },
                "usersid": { "type": "text", "analyzer": "custom_analyzer" },
                "registryloaded": { "type": "boolean" },
                "foldercreatedtime": { "type": "date" },
                "foldermodifiedtime": { "type": "date" },
                "lastlogontime": { "type": "date" },
                "privileglevel": { "type": "text", "analyzer": "custom_analyzer" }
          }
        },
        "windowsactivity": {
          "properties": {
                "user_name": { "type": "text", "analyzer": "custom_analyzer" },
                "app_id": { "type": "text", "analyzer": "custom_analyzer" },
                "app_activity_id": { "type": "text", "analyzer": "custom_analyzer" },
                "activity_type": { "type": "text", "analyzer": "custom_analyzer" },
                "activity_status": { "type": "text", "analyzer": "custom_analyzer" },
                "tag": { "type": "text", "analyzer": "custom_analyzer" },
                "group": { "type": "text", "analyzer": "custom_analyzer" },
                "priority": { "type": "integer" },
                "is_local_only": { "type": "boolean" },
                "etag": { "type": "integer" },
                "created_in_cloud": { "type": "date" },
                "last_modified_time": { "type": "date" },
                "expiration_time": { "type": "date" },
                "start_time": { "type": "date" },
                "end_time": { "type": "date" },
                "last_modified_on_client": { "type": "date" }
          }
        },
        "wireless": {
          "properties": {
                "profilename": { "type": "text", "analyzer": "custom_analyzer" },
                "authentication": { "type": "text", "analyzer": "custom_analyzer" },
                "encryption": { "type": "text", "analyzer": "custom_analyzer" },
                "connectiontype": { "type": "text", "analyzer": "custom_analyzer" },
                "password": { "type": "text", "analyzer": "custom_analyzer" },
                "interfacedescription": { "type": "text", "analyzer": "custom_analyzer" },
                "adapterguid": { "type": "text", "analyzer": "custom_analyzer" },
                "filename": { "type": "text", "analyzer": "custom_analyzer" },
                "lastmodifiedtime": { "type": "date" }
          }
        }
      }
    }
  }
}
'
