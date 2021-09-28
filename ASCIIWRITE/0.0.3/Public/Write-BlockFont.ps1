<#
.Synopsis
    Write-BlockFont.ps1
     
    AUTHOR: Robin Granberg (robin.granberg@protonmail.com)
    
    THIS CODE-SAMPLE IS PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED 
    OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR 
    FITNESS FOR A PARTICULAR PURPOSE.
    
.DESCRIPTION
    A script that will write your phrase in to a ascii block art

.EXAMPLE
    .\Write-BlockFont -Phrase "LEET"

    Writes the phrase LEET in ASCII block font

.EXAMPLE
    .\Write-BlockFont -Phrase "LEET" -ShadowColor Green

    Writes the phrase LEET in ASCII block font with shadows in green.

.EXAMPLE
    .\Write-BlockFont -Phrase "LEET" -ShadowColor Green -Color1 DarkGreen

    Writes the phrase LEET in ASCII block font with shadows in green and the center of the font in dark green.

.EXAMPLE
    .\Write-BlockFont -Phrase "LEET" -ShadowColor Green -Color1 DarkCyan -Color2 DarkMagenta

    Writes the phrase LEET in ASCII block font with shadows in green and the center of the font in dark cyan and the outer of the font in dark magenta.    

.EXAMPLE
    .\Write-BlockFont -Phrase "LEET" -ShadowColor Green -Color1 DarkCyan -Color2 DarkMagenta -Frame -FrameColor Green  

    Writes the phrase LEET in ASCII block font also with a frame in green

.OUTPUTS
    writes to host

.LINK
    
.NOTES
    Version: 0.0.3
    28 September, 2021

    ## New
    - ASCII character for dash
#>
Function Write-BlockFont
{
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$True)]
        [string]
        $Phrase,
        # Color 1.
        [Parameter(Mandatory=$false)]
        [ValidateSet("Black","DarkBlue","DarkGreen","DarkCyan","DarkRed","DarkMagenta","DarkYellow","Gray","DarkGray","Blue","Green","Cyan","Red","Magenta","Yellow","White")]
        [ValidateNotNull()]
        [ValidateNotNullOrEmpty()]
        [string] 
        $Color1 = "White",
        # Color 2.
        [Parameter(Mandatory=$false)]
        [ValidateSet("Black","DarkBlue","DarkGreen","DarkCyan","DarkRed","DarkMagenta","DarkYellow","Gray","DarkGray","Blue","Green","Cyan","Red","Magenta","Yellow","White")]
        [ValidateNotNull()]
        [ValidateNotNullOrEmpty()]
        [string] 
        $Color2 = "White",    
        #ShadowColor  
        [Parameter(Mandatory=$false)]
        [ValidateSet("Black","DarkBlue","DarkGreen","DarkCyan","DarkRed","DarkMagenta","DarkYellow","Gray","DarkGray","Blue","Green","Cyan","Red","Magenta","Yellow","White")]
        [ValidateNotNull()]
        [ValidateNotNullOrEmpty()]
        [string] 
        $ShadowColor = "White",    
        #FrameColor  
        [Parameter(Mandatory=$false)]
        [ValidateSet("Black","DarkBlue","DarkGreen","DarkCyan","DarkRed","DarkMagenta","DarkYellow","Gray","DarkGray","Blue","Green","Cyan","Red","Magenta","Yellow","White")]
        [ValidateNotNull()]
        [ValidateNotNullOrEmpty()]
        [string] 
        $FrameColor = "White",      
        [Parameter(Mandatory=$false)]
        [string]
        $MyChar="█"  ,      
        [Parameter(Mandatory=$false)]
        [switch]
        $Frame 

    )




[String[]]$Lframe = "│  ","*","│  ","*","│  ","*","│  ","*","│  ","*","│  "
[String[]]$Rframe = "│╗","*","│║","*","│║", "*","│║","*","│║","*","│║"
[String[]]$SPACE = "      ","*","      ","*","      ", "*","      ","*","      ","*","      "
[String[]]$DOT = "      ","*","      ","*","      ", "*","      ","*","██╗   ","*","╚═╝   "
[String[]]$DASH = "           ","*","           ","*","██████╗    ","*","╚═════╝    ","*","           ","*","           "
[String[]]$A = "  ██████╗     ","*","██╔═════██╗   ","*","██████████║   ","*","██╔═════██║   ","*","██║     ██║   ","*","╚═╝     ╚═╝   "
[String[]]$B = "███████╗     ","*","██╔════██╗   ", "*","███████╔═╝   ", "*","██╔════██╗   ", "*","███████╔═╝   ","*","╚══════╝     " 
[String[]]$C = "  ██████╗   ","*","██╔═════╝   ","*","██║         ","*","██║         ","*","╚═██████╗   ", "*","  ╚═════╝   "
[String[]]$D = "███████╗     ","*","██╔════██╗   ","*","██║    ██║   ","*","██║    ██║   ","*","███████╔╝    ","*","╚══════╝     "
[String[]]$E = "███████╗   ","*","██╔════╝   ","*","██████╗    ","*","██╔═══╝    ","*","███████╗   ","*","╚══════╝   "
[String[]]$F = "███████╗   ","*","██╔════╝   ","*","██████╗    ","*","██╔═══╝    ","*","██║        ","*","╚═╝        "
[String[]]$G = "  ███████╗   ","*","██╔══════╝   ","*","██║  ████╗   ","*","██║    ██║   ","*","╚═███████║   ","*","  ╚══════╝   "
[String[]]$H = "██╗    ██╗   ","*","██║    ██║   ","*","█████████║   ","*","██╔════██║   ","*","██║    ██║   ","*","╚═╝    ╚═╝   "
[String[]]$I = "██╗   ","*","██║   ","*","██║   ", "*","██║   ","*","██║   ","*","╚═╝   "
[String[]]$J = "     ██╗   ","*","     ██║   ","*","     ██║   ","*","     ██║   ","*","██████╔╝   ","*","╚═════╝    "
[String[]]$K = "██╗   ██╗   ","*","██║ ██╔═╝   ","*","█████╔╝     ","*","██╔═██╗     ","*","██║  ╚██╗   ", "*","╚═╝   ╚═╝   "
[String[]]$L = "██╗        ","*","██║        ","*","██║        ","*","██║        ","*","███████╗   ","*","╚══════╝   "
[String[]]$M = "██╗     ██╗   ","*","████╗ ████║   ","*","██╔═██╔═██║   ","*","██║ ╚═╝ ██║   ","*","██║     ██║   ","*","╚═╝     ╚═╝   "
[String[]]$N = "██╗     ██╗   ","*","████╗   ██║   ","*","██╔═██╗ ██║   ","*","██║ ╚═████║   ","*","██║   ╚═██║   ","*","╚═╝     ╚═╝   " 
[String[]]$O = "  ██████╗     ","*","██╔═════██╗   ","*","██║     ██║   ","*","██║     ██║   ","*","╚═██████╔═╝   ","*","  ╚═════╝     "
[String[]]$P = "██████╗     ","*","██╔═══██╗   ","*","██████╔═╝   ","*","██╔═══╝     ","*","██║         ","*","╚═╝         "
[String[]]$Q = "  ██████╗       ","*","██╔═════██╗     ","*","██║     ██║     ","*","██║   ████║     ","*","╚═██████╔═██╗   ","*","  ╚═════╝ ╚═╝   "
[String[]]$R = "██████╗     ","*","██╔═══██╗   ","*","██████╔═╝   ","*","██╔══██╗    ","*","██║   ██╗   ","*","╚═╝   ╚═╝   "
[String[]]$S = "  ████████╗   ","*","██╔═══════╝   ","*","╚═██████╗     ","*","  ╚═════██╗   ","*","████████╔═╝   ","*","╚═══════╝     "
[String[]]$T = "██████████╗   ","*"," ╚══██╔═══╝   ","*","    ██║       ","*","    ██║       ","*","    ██║       ","*","    ╚═╝       "
[String[]]$U = "██╗     ██╗   ","*","██║     ██║   ","*","██║     ██║   ","*","██║     ██║   ","*","╚═██████╔═╝   ","*","  ╚═════╝     "
[String[]]$V = "██╗     ██╗   ","*","██║     ██║   ","*","╚═██╗ ██╔═╝   ","*","  ██║ ██║     ","*","  ╚═██╔═╝     ","*","    ╚═╝       "
[String[]]$W = "██╗     ██╗   ","*","██║ ██╗ ██║   ","*","██║ ██║ ██║   ","*","██║ ██║ ██║   ","*","╚═██████╔═╝   ","*","  ╚═════╝     "
[String[]]$X = "██╗     ██╗   ","*","╚═██╗ ██╔═╝   ","*","  ╚═██╔═╝     ","*","  ██╔╝██╗     ","*","██╔═╝ ╚═██╗   ","*","╚═╝     ╚═╝   " 
[String[]]$Y = "██      ██╗   ","*","██      ██║   ","*","╚═██████╔═╝   ","*","  ╚═██╔═╝     ","*","    ██║       ","*","    ╚═╝       "
[String[]]$Z = "██████████╗   ","*","╚═════██╔═╝   ","*","    ██╔═╝     ","*","  ██╔═╝       ","*","██████████╗   ","*","╚═════════╝   "
[String[]]$1 = "████╗     ","*","╚═██║     ","*","  ██║     ", "*","  ██║     ","*","██████╗   ","*","╚═════╝   "
[String[]]$2 = "██████████╗   ","*","╚═══════██║   ","*","  ██████╔═╝   ","*","██╔═════╝     ","*","██████████╗   ","*","╚═════════╝   "
[String[]]$3 = "███████╗     ","*","╚══════██╗   ", "*","  █████╔═╝   ", "*","  ╚════██╗   ", "*","███████╔═╝   ","*","╚══════╝     " 
[String[]]$4 = "██╗    ██╗   ","*","██║    ██║   ","*","█████████║   ","*","╚══════██║   ","*","       ██║   ","*","       ╚═╝   "
[String[]]$5 = "██████████╗   ","*","██╔═══════╝   ","*","╚═██████╗     ","*","  ╚═════██╗   ","*","████████╔═╝   ","*","╚═══════╝     "
[String[]]$6 = "  ████████╗   ","*","██╔═══════╝   ","*","████████╗     ","*","██╚═════██╗   ","*","╚═██████╔═╝   ","*","  ╚═════╝     "
[String[]]$7 = "██████████╗   ","*","╚═══════██║   ","*","      ██╔═╝   ","*","    ██╔═╝     ","*","    ██║       ","*","    ╚═╝       "
[String[]]$8 = "  ██████╗     ","*","██╔═════██╗   ","*","  ██████╔═╝   ","*","██╔═════██╗   ","*","  ███████╔╝   ","*","  ╚══════╝    "
[String[]]$9 = "██████████╗   ","*","██╔═════██║   ","*","██████████║   ","*","╚═══════██║   ","*","██████████║   ","*","╚═════════╝   "
[String[]]$0 = "██████████╗   ","*","██╔═════██║   ","*","██║     ██║   ","*","██║     ██║   ","*","██████████║   ","*","╚═════════╝   "

Function Test-ShadowStrings
{
    [CmdletBinding()]
    param (
        [Parameter()]
        [string]
        $Teststring
    )

    switch ($Char)
    {
        "╗"{$true}
        "╚"{$true}
        "═"{$true}
        "╝"{$true}
        "╔"{$true}
        "║"{$true}
        default{$false}
    }


}
Function Create-BlockText
{
    [CmdletBinding()]
    param (
        [Parameter()]
        [string]
        $Phrase,
        [Parameter()]
        [string]
        $ForegroundColor1,
        [Parameter()]
        [string]
        $ForegroundColor2       
    )
    
    if($Phrase)
    {
        $PHRASEOBJECT = New-Object System.Collections.ArrayList
        if($Frame)
        {
            [VOID]$PHRASEOBJECT.add($Lframe)
        }
        $arrString = $Phrase.ToCharArray() 
        foreach($Char in $arrString)
        {
            switch ($Char) {
                "A" {[VOID]$PHRASEOBJECT.add($A)}
                "B" {[VOID]$PHRASEOBJECT.add($B)}
                "C" {[VOID]$PHRASEOBJECT.add($C)}
                "D" {[VOID]$PHRASEOBJECT.add($D)}
                "E" {[VOID]$PHRASEOBJECT.add($E)}
                "F" {[VOID]$PHRASEOBJECT.add($F)}
                "G" {[VOID]$PHRASEOBJECT.add($G)}                
                "H" {[VOID]$PHRASEOBJECT.add($H)}                  
                "I" {[VOID]$PHRASEOBJECT.add($I)}
                "J" {[VOID]$PHRASEOBJECT.add($J)} 
                "K" {[VOID]$PHRASEOBJECT.add($K)}
                "L" {[VOID]$PHRASEOBJECT.add($L)}
                "M" {[VOID]$PHRASEOBJECT.add($M)}                
                "N" {[VOID]$PHRASEOBJECT.add($N)}
                "O" {[VOID]$PHRASEOBJECT.add($O)}
                "Q" {[VOID]$PHRASEOBJECT.add($Q)}                
                "P" {[VOID]$PHRASEOBJECT.add($P)}                
                "R" {[VOID]$PHRASEOBJECT.add($R)}
                "S" {[VOID]$PHRASEOBJECT.add($S)}
                "T" {[VOID]$PHRASEOBJECT.add($T)}                
                "U" {[VOID]$PHRASEOBJECT.add($U)}                   
                "V" {[VOID]$PHRASEOBJECT.add($V)}
                "W" {[VOID]$PHRASEOBJECT.add($W)}
                "X" {[VOID]$PHRASEOBJECT.add($X)}
                "Y" {[VOID]$PHRASEOBJECT.add($Y)}                
                "Z" {[VOID]$PHRASEOBJECT.add($Z)}
                "1" {[VOID]$PHRASEOBJECT.add($1)}
                "2" {[VOID]$PHRASEOBJECT.add($2)}
                "3" {[VOID]$PHRASEOBJECT.add($3)}
                "4" {[VOID]$PHRASEOBJECT.add($4)}                
                "5" {[VOID]$PHRASEOBJECT.add($5)}                     
                "6" {[VOID]$PHRASEOBJECT.add($6)}                      
                "7" {[VOID]$PHRASEOBJECT.add($7)}                
                "8" {[VOID]$PHRASEOBJECT.add($8)}                                
                "9" {[VOID]$PHRASEOBJECT.add($9)}
                "0" {[VOID]$PHRASEOBJECT.add($0)}
                " " {[VOID]$PHRASEOBJECT.add($SPACE)}
                "." {[VOID]$PHRASEOBJECT.add($DOT)}
                "-" {[VOID]$PHRASEOBJECT.add($DASH)}
                Default {[VOID]$PHRASEOBJECT.add($DOT)}
            }

        }
    }
    if($Frame)
    {
        [VOID]$PHRASEOBJECT.add($Rframe)
    }
    [int]$LenOfAll = 0
    foreach($LETTER in $PHRASEOBJECT)
    {
        $LenOfAll = $LenOfAll + $LETTER[0].ToString().Length
        
    }    
    $LenOfAll = $LenOfAll -2
    if($Frame)
    {
        for ($num = 0 ; $num -le $LenOfAll ; $num++)
        {    
            if($num -eq 0)
            {
                Write-Host -NoNewline "┌" -ForegroundColor $FrameColor
            }
            else {            
                if($num -eq $LenOfAll)
                {
                    Write-Host "┐ " -ForegroundColor $FrameColor
                }
                else {
                    Write-Host -NoNewline "─"  -ForegroundColor $FrameColor
                }
            }
        }    
    }
    
    for ($num = 0 ; $num -le 12 ; $num++)
    {    
        $LetterCount = 0
        $FrameLetter = $false
        foreach($LETTER in $PHRASEOBJECT)
        {
            $LetterCount++
            if($Frame)
            {
                if(($LetterCount -eq 1) -or ($LetterCount -eq $PHRASEOBJECT.Count))
                {
                    $FrameLetter = $True
                }
                else {
                    $FrameLetter = $false
                }
            }
            
            foreach($LINE in $LETTER[$num])
            {
                $LINE = $LINE.ToString().Replace("█",$MyChar)
                if($LINE -eq "*")
                {
                    if($PREVLINE -ne "*")
                    {
                        Write-Host ""
                    }
                    $PREVLINE = $LINE
                }
                else {
                    if($FrameLetter)
                    {
                        Write-Host -NoNewline $LINE -ForegroundColor $FrameColor
                    }
                    else {
                        
                    
                    if($ForegroundColor1)
                    {
                        if($num -le 6)
                        {
                            if($num -ge 2)
                            {
                                #Write-Host -NoNewline $LINE -ForegroundColor $ForegroundColor1
                                $arrChars = $LINE.ToCharArray() 

                                foreach($Char in $arrChars)
                                {
                                    if(Test-ShadowStrings $Char)
                                    {
                                        Write-Host -NoNewline $Char -ForegroundColor $ShadowColor
                                    } 
                                    else {
                                        Write-Host -NoNewline $Char -ForegroundColor $ForegroundColor1
                                    }
                                }                                
                            }
                            else {
                                #Write-Host -NoNewline $LINE -ForegroundColor $ForegroundColor2
                                $arrChars = $LINE.ToCharArray() 

                                foreach($Char in $arrChars)
                                {
                                    if(Test-ShadowStrings $Char)
                                    {
                                        Write-Host -NoNewline $Char -ForegroundColor $ShadowColor
                                    } 
                                    else {
                                        Write-Host -NoNewline $Char -ForegroundColor $ForegroundColor2
                                    }
                                }                                      
                            }
                        }
                        else {
                            #Write-Host -NoNewline $LINE -ForegroundColor $ForegroundColor2
                            $arrChars = $LINE.ToCharArray() 

                            foreach($Char in $arrChars)
                            {
                                if(Test-ShadowStrings $Char)
                                {
                                    Write-Host -NoNewline $Char -ForegroundColor $ShadowColor
                                } 
                                else {
                                    Write-Host -NoNewline $Char -ForegroundColor $ForegroundColor2
                                }
                            }                              
                        }
                    }
                    else {
                        #Write-Host -NoNewline  $LINE  
                        $arrChars = $LINE.ToCharArray() 

                        foreach($Char in $arrChars)
                        {
                            if(Test-ShadowStrings $Char)
                            {
                                Write-Host -NoNewline $Char -ForegroundColor $ShadowColor
                            } 
                            else {
                                Write-Host -NoNewline $Char 
                            }
                        }                  
                    }
                }
                    $PREVLINE = $LINE
                }
            }
        }

    }
    Write-Host "" 
    if($Frame)
    {
        for ($num = 0 ; $num -le $LenOfAll ; $num++)
        {    
            if($num -eq 0)
            {
                Write-Host -NoNewline "└" -ForegroundColor $FrameColor
            }
            else {            
                if($num -eq $LenOfAll)
                {
                    Write-Host "┘║" -ForegroundColor $FrameColor
                }
                else {
                    Write-Host -NoNewline "─"  -ForegroundColor $FrameColor
                }
            }
        }    
    }    
    if($Frame)
    {
        for ($num = 1 ; $num -le $LenOfAll ; $num++)
        {    
            if($num -eq 1)
            {
                Write-Host -NoNewline " ╚" -ForegroundColor $FrameColor
            }
            else {            
                if($num -eq $LenOfAll)
                {
                    Write-Host "═╝" -ForegroundColor $FrameColor
                }
                else {
                    Write-Host -NoNewline "═"  -ForegroundColor $FrameColor 
                }
            }
        }    
    }        
    Write-Host "" 
}

if ($Phrase) {
    
    if($Color1)
    {
        Create-BlockText -Phrase $Phrase -ForegroundColor1 $Color1 -ForegroundColor2 $Color2
    }
    else {
        Create-BlockText -Phrase $Phrase 
    }

}    
else {
    break
}

}

