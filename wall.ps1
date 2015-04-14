$URI = "http://alpha.wallhaven.cc/search?q=nature&categories=111&purity=110&resolutions=1920x1080&sorting=random&order=desc"
$URL = "http://wallpapers.wallhaven.cc/wallpapers/full/wallhaven-"
$DEST = "c:\wallpapers\0.jpg"


$HttpContent = Invoke-WebRequest -URI $URI
$var = $HttpContent.Links | Foreach {$_.href } 
$var = echo $var | select-string 'http://alpha.wallhaven.cc/wallpaper/' | select-string -NotMatch "favorites" | select-string -NotMatch "thumbTags" 
$var = $var -replace 'http://alpha.wallhaven.cc/wallpaper/','' 
$var = $var -replace "``n","" | select -first 1

Invoke-WebRequest $URL$var".jpg" -OutFile $DEST

Set-ItemProperty -path 'HKCU:\Control Panel\Desktop\' -name wallpaper -value $DEST
rundll32.exe user32.dll, UpdatePerUserSystemParameters
rundll32.exe user32.dll, UpdatePerUserSystemParameters  
rundll32.exe user32.dll, UpdatePerUserSystemParameters  
rundll32.exe user32.dll, UpdatePerUserSystemParameters
