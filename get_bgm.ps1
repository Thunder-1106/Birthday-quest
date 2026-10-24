$urls = @(
  "https://ia800501.us.archive.org/12/items/GameOfThronesOfficialThemeSong/Game%20of%20Thrones%20Official%20Theme%20Song.mp3",
  "https://ia801900.us.archive.org/10/items/game-of-thrones-theme-song/Game%20of%20Thrones%20Theme%20Song.mp3",
  "https://ia600906.us.archive.org/21/items/GameOfThronesSoundtrack-MainTheme/01MainTheme.mp3"
)

foreach ($u in $urls) {
  Write-Host "Trying to download GoT BGM from: $u"
  curl.exe -L -A "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36" -o "assets/got_theme.mp3" $u
  if (Test-Path "assets/got_theme.mp3") {
    $len = (Get-Item "assets/got_theme.mp3").Length
    if ($len -gt 500000) {
      Write-Host "Success! Downloaded authentic GoT BGM size: $len bytes"
      break
    }
  }
}
