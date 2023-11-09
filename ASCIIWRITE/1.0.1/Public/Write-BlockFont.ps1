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

**Version: 1.0.0**

**9 November, 2023**

**New Features**
* Support for Windows PowerShell 5.1


#>
Function Write-BlockFont
{
    # AUTHOR: Robin Granberg (robin.granberg@protonmail.com)
    # 9 November, 2023
    # Version: 1.0.0
    [CmdletBinding(DefaultParameterSetName = "Letter")]
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

        [Parameter(Mandatory=$false,
        ParameterSetName='Letter')]
        [ValidateSet(888,9617,9618,9619)]
        [int]
        $LetterChar=9619,      

        [Parameter(Mandatory=$false,
        ParameterSetName='Custom')]
        [int]
        $CustomChar,

        [Parameter(Mandatory=$false)]
        [switch]
        $Frame 

    )


if($CustomChar)
{
    $WrittenLetterChar =$CustomChar
}
else
{
    $WrittenLetterChar=$LetterChar
}


[String[]]$Lframe = "A  ","*","A  ","*","A  ","*","A  ","*","A  ","*","A  "
[String[]]$Rframe = "BY","*","AS","*","AS", "*","AS","*","AS","*","AS"
[String[]]$SPACE = "      ","*","      ","*","      ", "*","      ","*","      ","*","      "
[String[]]$DOT = "      ","*","      ","*","      ", "*","      ","*","PPY   ","*","OIC   "
[String[]]$DASH = "           ","*","           ","*","PPPPPPY    ","*","OIIIIIC    ","*","           ","*","           "
[String[]]$A = "  PPPPPPY     ","*","PPLIIIIIPPY   ","*","PPPPPPPPPPS   ","*","PPLIIIIIPPS   ","*","PPS     PPS   ","*","OIC     OIC   "
[String[]]$B = "PPPPPPPY     ","*","PPLIIIIPPY   ", "*","PPPPPPPLIC   ", "*","PPLIIIIPPY   ", "*","PPPPPPPLIC   ","*","OIIIIIIC     " 
[String[]]$C = "  PPPPPPY   ","*","PPLIIIIIC   ","*","PPS         ","*","PPS         ","*","OIPPPPPPY   ", "*","  OIIIIIC   "
[String[]]$D = "PPPPPPPY     ","*","PPLIIIIPPY   ","*","PPS    PPS   ","*","PPS    PPS   ","*","PPPPPPPLC    ","*","OIIIIIIC     "
[String[]]$E = "PPPPPPPY   ","*","PPLIIIIC   ","*","PPPPPPY    ","*","PPLIIIC    ","*","PPPPPPPY   ","*","OIIIIIIC   "
[String[]]$F = "PPPPPPPY   ","*","PPLIIIIC   ","*","PPPPPPY    ","*","PPLIIIC    ","*","PPS        ","*","OIC        "
[String[]]$G = "  PPPPPPPY   ","*","PPLIIIIIIC   ","*","PPS  PPPPY   ","*","PPS    PPS   ","*","OIPPPPPPPS   ","*","  OIIIIIIC   "
[String[]]$H = "PPY    PPY   ","*","PPS    PPS   ","*","PPPPPPPPPS   ","*","PPLIIIIPPS   ","*","PPS    PPS   ","*","OIC    OIC   "
[String[]]$I = "PPY   ","*","PPS   ","*","PPS   ", "*","PPS   ","*","PPS   ","*","OIC   "
[String[]]$J = "     PPY   ","*","     PPS   ","*","     PPS   ","*","     PPS   ","*","PPPPPPLC   ","*","OIIIIIC    "
[String[]]$K = "PPY   PPY   ","*","PPS PPLIC   ","*","PPPPPLC     ","*","PPLIPPY     ","*","PPS  OPPY   ", "*","OIC   OIC   "
[String[]]$L = "PPY        ","*","PPS        ","*","PPS        ","*","PPS        ","*","PPPPPPPY   ","*","OIIIIIIC   "
[String[]]$M = "PPY     PPY   ","*","PPPPY PPPPS   ","*","PPLIPPLIPPS   ","*","PPS OIC PPS   ","*","PPS     PPS   ","*","OIC     OIC   "
[String[]]$N = "PPY     PPY   ","*","PPPPY   PPS   ","*","PPLIPPY PPS   ","*","PPS OIPPPPS   ","*","PPS   OIPPS   ","*","OIC     OIC   " 
[String[]]$O = "  PPPPPPY     ","*","PPLIIIIIPPY   ","*","PPS     PPS   ","*","PPS     PPS   ","*","OIPPPPPPLIC   ","*","  OIIIIIC     "
[String[]]$P = "PPPPPPY     ","*","PPLIIIPPY   ","*","PPPPPPLIC   ","*","PPLIIIC     ","*","PPS         ","*","OIC         "
[String[]]$Q = "  PPPPPPY       ","*","PPLIIIIIPPY     ","*","PPS     PPS     ","*","PPS   PPPPS     ","*","OIPPPPPPLIPPY   ","*","  OIIIIIC OIC   "
[String[]]$R = "PPPPPPY     ","*","PPLIIIPPY   ","*","PPPPPPLIC   ","*","PPLIIPPY    ","*","PPS   PPY   ","*","OIC   OIC   "
[String[]]$S = "  PPPPPPPPY   ","*","PPLIIIIIIIC   ","*","OIPPPPPPY     ","*","  OIIIIIPPY   ","*","PPPPPPPPLIC   ","*","OIIIIIIIC     "
[String[]]$T = "PPPPPPPPPPY   ","*"," OIIPPLIIIC   ","*","    PPS       ","*","    PPS       ","*","    PPS       ","*","    OIC       "
[String[]]$U = "PPY     PPY   ","*","PPS     PPS   ","*","PPS     PPS   ","*","PPS     PPS   ","*","OIPPPPPPLIC   ","*","  OIIIIIC     "
[String[]]$V = "PPY     PPY   ","*","PPS     PPS   ","*","OIPPY PPLIC   ","*","  PPS PPS     ","*","  OIPPLIC     ","*","    OIC       "
[String[]]$W = "PPY     PPY   ","*","PPS PPY PPS   ","*","PPS PPS PPS   ","*","PPS PPS PPS   ","*","OIPPPPPPLIC   ","*","  OIIIIIC     "
[String[]]$X = "PPY     PPY   ","*","OIPPY PPLIC   ","*","  OIPPLIC     ","*","  PPLCPPY     ","*","PPLIC OIPPY   ","*","OIC     OIC   " 
[String[]]$Y = "PP      PPY   ","*","PP      PPS   ","*","OIPPPPPPLIC   ","*","  OIPPLIC     ","*","    PPS       ","*","    OIC       "
[String[]]$Z = "PPPPPPPPPPY   ","*","OIIIIIPPLIC   ","*","    PPLIC     ","*","  PPLIC       ","*","PPPPPPPPPPY   ","*","OIIIIIIIIIC   "
[String[]]$1 = "PPPPY     ","*","OIPPS     ","*","  PPS     ", "*","  PPS     ","*","PPPPPPY   ","*","OIIIIIC   "
[String[]]$2 = "PPPPPPPPPPY   ","*","OIIIIIIIPPS   ","*","  PPPPPPLIC   ","*","PPLIIIIIC     ","*","PPPPPPPPPPY   ","*","OIIIIIIIIIC   "
[String[]]$3 = "PPPPPPPY     ","*","OIIIIIIPPY   ", "*","  PPPPPLIC   ", "*","  OIIIIPPY   ", "*","PPPPPPPLIC   ","*","OIIIIIIC     " 
[String[]]$4 = "PPY    PPY   ","*","PPS    PPS   ","*","PPPPPPPPPS   ","*","OIIIIIIPPS   ","*","       PPS   ","*","       OIC   "
[String[]]$5 = "PPPPPPPPPPY   ","*","PPLIIIIIIIC   ","*","OIPPPPPPY     ","*","  OIIIIIPPY   ","*","PPPPPPPPLIC   ","*","OIIIIIIIC     "
[String[]]$6 = "  PPPPPPPPY   ","*","PPLIIIIIIIC   ","*","PPPPPPPPY     ","*","PPOIIIIIPPY   ","*","OIPPPPPPLIC   ","*","  OIIIIIC     "
[String[]]$7 = "PPPPPPPPPPY   ","*","OIIIIIIIPPS   ","*","      PPLIC   ","*","    PPLIC     ","*","    PPS       ","*","    OIC       "
[String[]]$8 = "  PPPPPPY     ","*","PPLIIIIIPPY   ","*","  PPPPPPLIC   ","*","PPLIIIIIPPY   ","*","  PPPPPPPLC   ","*","  OIIIIIIC    "
[String[]]$9 = "PPPPPPPPPPY   ","*","PPLIIIIIPPS   ","*","PPPPPPPPPPS   ","*","OIIIIIIIPPS   ","*","PPPPPPPPPPS   ","*","OIIIIIIIIIC   "
[String[]]$0 = "PPPPPPPPPPY   ","*","PPLIIIIIPPS   ","*","PPS     PPS   ","*","PPS     PPS   ","*","PPPPPPPPPPS   ","*","OIIIIIIIIIC   "

$intCharBorderHorizontal1 = 9552
$intCharBorderLowRight1 = 9565
$intCharBorderHorizontal2 = 9472
$intCharBorderVertical1 = 9553
$intCharBorderLowLeft1 = 9562
$intCharBorderLowRight2 = 9496
$intCharBorderLowLeft2 = 9492
$intCharBorderVertical2 = 9474
$intCharBorderUpperRight1 = 9556
$intCharBorderUpperLeft1 = 9559
$intCharBorderUpperRight2 = 9488
$intCharBorderUpperLeft2 =9484
$intCharBorderLowLeft2Connect = 9573
$intCharBorderVerticalConnect2 = 9566

Function Test-ShadowStrings
{
    [CmdletBinding()]
    param (
        [Parameter()]
        [string]
        $Testchar
    )

    # if the char is not the same as the main letter char return True
    switch ($Testchar)
    {
        $([char]$WrittenLetterChar){$false}
        default{$true}
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
                Write-Host -NoNewline $([char]$intCharBorderUpperLeft2) -ForegroundColor $FrameColor
            }
            else {            
                if($num -eq $LenOfAll)
                {
                    Write-Host "$([char]$intCharBorderUpperRight2)" -ForegroundColor $FrameColor
                }
                else {
                    Write-Host -NoNewline "$([char]$intCharBorderHorizontal2)"  -ForegroundColor $FrameColor
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
                $LINE = $LINE.ToString().Replace("P",[char]$WrittenLetterChar)
                $LINE = $LINE.ToString().Replace("Y","$([char]$intCharBorderUpperLeft1)")
                $LINE = $LINE.ToString().Replace("S","$([char]$intCharBorderVertical1)")  
                $LINE = $LINE.ToString().Replace("C","$([char]$intCharBorderLowRight1)") 
                $LINE = $LINE.ToString().Replace("O","$([char]$intCharBorderLowLeft1)") 
                $LINE = $LINE.ToString().Replace("I","$([char]$intCharBorderHorizontal1)") 
                $LINE = $LINE.ToString().Replace("L","$([char]$intCharBorderUpperRight1)")
                $LINE = $LINE.ToString().Replace("A","$([char]$intCharBorderVertical2)")
                $LINE = $LINE.ToString().Replace("B","$([char]$intCharBorderVerticalConnect2)")
                 
                 
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
                Write-Host -NoNewline "$([char]$intCharBorderLowLeft2)" -ForegroundColor $FrameColor
            }
            elseif($num -eq 1)
            {
                Write-Host -NoNewline "$([char]$intCharBorderLowLeft2Connect)" -ForegroundColor $FrameColor
            }
            else {            
                if($num -eq $LenOfAll)
                {
                    Write-Host "$([char]$intCharBorderLowRight2)$([char]$intCharBorderVertical1)" -ForegroundColor $FrameColor
                }
                else {
                    Write-Host -NoNewline "$([char]$intCharBorderHorizontal2)"  -ForegroundColor $FrameColor
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
                Write-Host -NoNewline " $([char]$intCharBorderLowLeft1)" -ForegroundColor $FrameColor
            }
            else {            
                if($num -eq $LenOfAll)
                {
                    Write-Host "$([char]$intCharBorderHorizontal1)$([char]$intCharBorderLowRight1)" -ForegroundColor $FrameColor
                }
                else {
                    Write-Host -NoNewline "$([char]$intCharBorderHorizontal1)"  -ForegroundColor $FrameColor 
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

