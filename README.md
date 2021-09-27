# ASCIIWRITE


## Example

Requires PowerShell 7.1.1

Import-Module ASCIIWRITE

Write-BlockFont -Phrase "HELLO WORLD"

![](https://github.com/canix1/ASCIIWRITE/blob/main/src/hello.png)

Write-BlockFont -Phrase "1337" -ShadowColor Green -Color1 "Cyan" -Color2 Magenta

![](https://github.com/canix1/ASCIIWRITE/blob/main/src/1337.png)

Write-BlockFont -Phrase "NULL" -Frame -FrameColor DarkYellow

![](https://github.com/canix1/ASCIIWRITE/blob/main/src/frame.png)

Write-BlockFont -Phrase "AZURE AD" -MyChar "*" -Color1 Blue -Color2 Red -Frame -FrameColor DarkYellow -ShadowColor Green

![](https://github.com/canix1/ASCIIWRITE/blob/main/src/mychar.png)