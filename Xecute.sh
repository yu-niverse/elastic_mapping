#! /usr/bin/env bash

# directories=("Main" "Memory" "Explorer" "Collection" "LossCollection")
directories=("LossCollection")
# Loop through the directories
for dir in "${directories[@]}"; do
  # Check if the specified directory exists
  if [ ! -d "$dir" ]; then
    echo "Directory not found: $dir"
    exit 1
  fi
  cd "$dir" || exit 1

  files=$(find . -type f -executable)
  if [ -z "$files" ]; then
    echo "No executable scripts found in $dir"
    exit 1
  fi

  # Execute each script one by one
  for script in $files; do
    echo "Executing: $script"
    ./"$script" ed
    echo "Finished executing: $script"
  done
  cd ..
done

# array1=("ed_appresourceusagemonitor" "ed_arpcache" "ed_baseservice" "ed_chromebookmarks" "ed_chromecache" "ed_chromedownload" "ed_chromehistory" "ed_chromekeywordsearch" "ed_chromelogin" "ed_dnsinfo")
# array2=("ed_edgebookmarks" "ed_edgecache" "ed_edgecookies" "ed_edgehistory" "ed_edgelogin" "ed_eventapplication" "ed_eventsecurity" "ed_eventsystem" "ed_firefoxbookmarks" "ed_firefoxcache")

# for index in ${array2[@]}; do
#     echo $index
#     curl -X DELETE "http://192.168.200.190:9200/$index?pretty"
# done

# ./Collection/AppResourceUsageMonitor.sh  
# ./Collection/ChromeCache.sh          
# ./Collection/ChromeLogin.sh    
# ./Collection/EdgeCookies.sh       
# ./Collection/EventSecurity.sh     
# ./Collection/ARPCache.sh                 
# ./Collection/ChromeDownload.sh       
# ./Collection/DNSInfo.sh        
# ./Collection/EdgeHistory.sh       
# ./Collection/EventSystem.sh       
# ./Collection/BaseService.sh              
# ./Collection/ChromeHistory.sh        
# ./Collection/EdgeBookmarks.sh  
# ./Collection/EdgeLogin.sh         
# ./Collection/FirefoxBookmarks.sh
# ./Collection/ChromeBookmarks.sh          
# ./Collection/ChromeKeywordSearch.sh  
# ./Collection/EdgeCache.sh      
# ./Collection/EventApplication.sh  
# ./Collection/FirefoxCache.sh
# ./Collection/FirefoxCookies.sh
# ./Collection/FirefoxHistory.sh
# ./Collection/IEHistory.sh
# ./Collection/InstalledSoftware.sh
# ./Collection/JumpList.sh
# ./Collection/MUICache.sh
# ./Collection/Network.sh
# ./Collection/NetworkDataUsageMonitor.sh
# ./Collection/NetworkResources.sh
# ./Collection/OpenedFiles.sh
# ./Collection/Prefetch.sh
# ./Collection/Process.sh
# ./Collection/Service.sh
# ./Collection/Shortcuts.sh
# ./Collection/TaskSchedule.sh
# ./Collection/StartRun.sh
# ./Collection/USBDevices.sh
# ./Collection/UserAssist.sh
# ./Collection/UserProfiles.sh
# ./Collection/WindowsActivity.sh
# ./Collection/SqliteSequence.sh