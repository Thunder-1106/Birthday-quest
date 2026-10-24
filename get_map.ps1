$urls = @(
  "https://images.alphacoders.com/261/261173.jpg",
  "https://wallpapercave.com/wp/wp1818247.jpg",
  "https://images7.alphacoders.com/604/604928.jpg",
  "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/The_Known_World_A_Song_of_Ice_and_Fire.svg/1920px-The_Known_World_A_Song_of_Ice_and_Fire.svg.png"
)

foreach ($u in $urls) {
  Write-Host "Trying $u"
  curl.exe -L -A "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36" -o "assets/westeros_map.jpg" $u
  if (Test-Path "assets/westeros_map.jpg") {
    $len = (Get-Item "assets/westeros_map.jpg").Length
    if ($len -gt 50000) {
      Write-Host "Successfully downloaded Westeros map! Size: $len bytes"
      break
    }
  }
}
