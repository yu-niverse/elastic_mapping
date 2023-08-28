#! /usr/bin/env bash
elasticPrefix=$1

curl -X PUT "http://ela-master.ed.qa:9200/${elasticPrefix}_usbdevices?pretty" -H 'Content-Type: application/json' -d'
{
    "settings": {
        "number_of_shards": 1,
        "number_of_replicas": 1
    },
    "mappings": {
        "_doc": {
            "dynamic": "strict",
            "properties": {
                "uuid": { "type": "keyword" },
                "agent": { "type": "keyword" },
                "agentIP": { "type": "ip" },
                "agentName": { "type": "text" },
                "device_instance_id": { "type": "text" },
                "device_description": { "type": "text" },
                "hardware_ids": { "type": "text" },
                "bus_reported_device_description": { "type": "text" },
                "device_manufacturer": { "type": "text" },
                "device_friendly_name": { "type": "text" },
                "device_location_info": { "type": "text" },
                "device_security_descriptor_string": { "type": "text" },
                "containerid": { "type": "text" },
                "device_display_category": { "type": "text" },
                "device_letter": { "type": "text" },
                "enumerator": { "type": "text" },
                "install_date": { "type": "date" },
                "first_install_date": { "type": "date" },
                "last_arrival_date": { "type": "date" },
                "last_removal_date": { "type": "date" },
                "item_main": { "type": "text" },
                "date_main": { "type": "date" },
                "type_main": { "type": "text" },
                "etc_main": { "type": "text" }
            }
        }
    }
}
'