#! /usr/bin/env bash

# array1=("ed_appresourceusagemonitor" "ed_arpcache" "ed_baseservice" "ed_chromebookmarks" "ed_chromecache" "ed_chromedownload" "ed_chromehistory" "ed_chromekeywordsearch" "ed_chromelogin" "ed_dnsinfo")
# array2=("ed_edgebookmarks" "ed_edgecache" "ed_edgecookies" "ed_edgehistory" "ed_edgelogin" "ed_eventapplication" "ed_eventsecurity" "ed_eventsystem" "ed_firefoxbookmarks" "ed_firefoxcache")

# for index in ${array2[@]}; do
#     echo $index
#     curl -X DELETE "http://ela-master.ed.qa:9200/$index?pretty"
# done


# ./AppResourceUsageMonitor.sh  
# ./ChromeCache.sh          
# ./ChromeLogin.sh    
# ./EdgeCookies.sh       
# ./EventSecurity.sh     
# ./ARPCache.sh                 
# ./ChromeDownload.sh       
# ./DNSInfo.sh        
# ./EdgeHistory.sh       
# ./EventSystem.sh       
# ./BaseService.sh              
# ./ChromeHistory.sh        
# ./EdgeBookmarks.sh  
# ./EdgeLogin.sh         
# ./FirefoxBookmarks.sh
# ./ChromeBookmarks.sh          
# ./ChromeKeywordSearch.sh  
# ./EdgeCache.sh      
# ./EventApplication.sh  
# ./FirefoxCache.sh
# ./FirefoxCookies.sh
# ./FirefoxHistory.sh
# ./IEHistory.sh
# ./InstalledSoftware.sh
# ./JumpList.sh
# ./MUICache.sh
# ./Network.sh
# ./NetworkDataUsageMonitor.sh
# ./NetworkResources.sh
# ./OpenedFiles.sh
# ./Prefetch.sh
# ./Process.sh
# ./Service.sh
# ./Shortcuts.sh
# ./TaskSchedule.sh
# ./StartRun.sh
# ./USBDevices.sh
# ./UserAssist.sh
# ./UserProfiles.sh
# ./WindowsActivity.sh
# ./SqliteSequence.sh