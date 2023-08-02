#! /usr/bin/env bash

curl -X PUT "http://ela-master.ed.qa:9200/ed_usbdevices?pretty" -H 'Content-Type: application/json' -d'
{
    "mappings": {
        "_doc": {
            "dynamic": "strict",
            "properties": {
                "uuid": { "type": "keyword" },
                "agent": { "type": "keyword" },
                "device_instance_id": { "type": "keyword" },
                "device_description": { "type": "text" },
                "hardware_ids": { "type": "text" },
                "bus_reported_device_description": { "type": "text" },
                "device_manufacturer": { "type": "text" },
                "device_friendly_name": { "type": "text" },
                "device_location_info": { "type": "text" },
                "device_security_descriptor_string": { "type": "text" },
                "containerid": { "type": "keyword" },
                "device_display_category": { "type": "text" },
                "device_letter": { "type": "text" },
                "enumerator": { "type": "keyword" },
                "install_date": { "type": "date" },
                "first_install_date": { "type": "date" },
                "last_arrival_date": { "type": "date" },
                "last_removal_date": { "type": "date" }
            }
        }
    }
}
'