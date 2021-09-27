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

.OUTPUTS
    writes to host

.LINK
    
.NOTES
    Version: 0.0.1
    27 September, 2021
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
        [Parameter(Mandatory=$false)]
        [string]
        $MyChar="█"   

    )





[String[]]$SPACE = "      ","*","      ","*","      ", "*","      ","*","      ","*","      "
[String[]]$DOT = "      ","*","      ","*","      ", "*","      ","*","██╗   ","*","╚═╝   "
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
        $PHRASEOBJETCT = New-Object System.Collections.ArrayList
        
        $arrString = $Phrase.ToCharArray() 
        foreach($Char in $arrString)
        {
            switch ($Char) {
                "A" {[VOID]$PHRASEOBJETCT.add($A)}
                "B" {[VOID]$PHRASEOBJETCT.add($B)}
                "C" {[VOID]$PHRASEOBJETCT.add($C)}
                "D" {[VOID]$PHRASEOBJETCT.add($D)}
                "E" {[VOID]$PHRASEOBJETCT.add($E)}
                "F" {[VOID]$PHRASEOBJETCT.add($F)}
                "G" {[VOID]$PHRASEOBJETCT.add($G)}                
                "H" {[VOID]$PHRASEOBJETCT.add($H)}                  
                "I" {[VOID]$PHRASEOBJETCT.add($I)}
                "J" {[VOID]$PHRASEOBJETCT.add($J)} 
                "K" {[VOID]$PHRASEOBJETCT.add($K)}
                "L" {[VOID]$PHRASEOBJETCT.add($L)}
                "M" {[VOID]$PHRASEOBJETCT.add($M)}                
                "N" {[VOID]$PHRASEOBJETCT.add($N)}
                "O" {[VOID]$PHRASEOBJETCT.add($O)}
                "Q" {[VOID]$PHRASEOBJETCT.add($Q)}                
                "P" {[VOID]$PHRASEOBJETCT.add($P)}                
                "R" {[VOID]$PHRASEOBJETCT.add($R)}
                "S" {[VOID]$PHRASEOBJETCT.add($S)}
                "T" {[VOID]$PHRASEOBJETCT.add($T)}                
                "U" {[VOID]$PHRASEOBJETCT.add($U)}                   
                "V" {[VOID]$PHRASEOBJETCT.add($V)}
                "W" {[VOID]$PHRASEOBJETCT.add($W)}
                "X" {[VOID]$PHRASEOBJETCT.add($X)}
                "Y" {[VOID]$PHRASEOBJETCT.add($Y)}                
                "Z" {[VOID]$PHRASEOBJETCT.add($Z)}
                "1" {[VOID]$PHRASEOBJETCT.add($1)}
                "2" {[VOID]$PHRASEOBJETCT.add($2)}
                "3" {[VOID]$PHRASEOBJETCT.add($3)}
                "4" {[VOID]$PHRASEOBJETCT.add($4)}                
                "5" {[VOID]$PHRASEOBJETCT.add($5)}                     
                "6" {[VOID]$PHRASEOBJETCT.add($6)}                      
                "7" {[VOID]$PHRASEOBJETCT.add($7)}                
                "8" {[VOID]$PHRASEOBJETCT.add($8)}                                
                "9" {[VOID]$PHRASEOBJETCT.add($9)}
                "0" {[VOID]$PHRASEOBJETCT.add($0)}
                " " {[VOID]$PHRASEOBJETCT.add($SPACE)}
                "." {[VOID]$PHRASEOBJETCT.add($DOT)}
                Default {[VOID]$PHRASEOBJETCT.add($DOT)}
            }
        }
    }

    for ($num = 0 ; $num -le 12 ; $num++)
    {    
        foreach($LETTER in $PHRASEOBJETCT)
        {
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
                    
                    $PREVLINE = $LINE
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

