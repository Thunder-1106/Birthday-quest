$wc = New-Object System.Net.WebClient
$wc.Headers.Add('User-Agent', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36')

$downloads = @(
  @{ Name = "jon_snow.jpg"; Url = "https://upload.wikimedia.org/wikipedia/en/3/30/Jon_Snow_Season_8.png" },
  @{ Name = "tyrion.jpg"; Url = "https://upload.wikimedia.org/wikipedia/en/5/50/Tyrion_Lannister-Peter_Dinklage.jpg" },
  @{ Name = "cersei.jpg"; Url = "https://upload.wikimedia.org/wikipedia/en/9/94/Cersei_Lannister-Lena_Headey.jpg" },
  @{ Name = "arya.jpg"; Url = "https://upload.wikimedia.org/wikipedia/en/3/39/Arya_Stark-Maisie_Williams.jpg" },
  @{ Name = "westeros_map.jpg"; Url = "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/The_Known_World_A_Song_of_Ice_and_Fire.svg/1280px-The_Known_World_A_Song_of_Ice_and_Fire.svg.png" }
)

foreach ($item in $downloads) {
  try {
    $dest = "assets\" + $item.Name
    $wc.DownloadFile($item.Url, $dest)
    Write-Host ("Downloaded: " + $item.Name)
  } catch {
    Write-Host ("Failed " + $item.Name + ": " + $_.Exception.Message)
  }
}
