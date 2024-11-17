# This profile will persist for all users and all hosts (Powershell Console)
# it enables dotnet cli tab autocomplete, git tab autocomplete, git status CLI && custom colors


# ****************************
#  **************************
#  ** ** ** _SETUP_ * ** **
#  **************************
# ****************************
# _START_

# create the file: `code $PROFILE.AllUsersAllHosts`
# install posh-git:
    # first time install: `PowerShellGet\Install-Module posh-git -Scope CurrentUser -Force`
    # if installed, update: `PowerShellGet\Update-Module posh-git`
# copy the contents of this file into newly created `profile.ps1`
# update the `Set-Location C:\Users\User\Dev` line to your Home directory


# _/END_SETUP_
# ****************************
# ****************************

# ****************************
#  **************************
#  ** ** * _INITIAL_ * ** **
#  **************************
# ****************************
# _START_

# Imports posh-git Module [Docs](https://github.com/dahlbyk/posh-git)
Import-Module posh-git

$colors = "#4B0082", "#FF69B4", "#FF00FF", "#00CED1", "#008B8B", "#8A2BE2", "#800080", "#87CEEB", "#6A5ACD", "#00FA9A"
$delimcolors = "#7FFF00", "#800000", "#FF8C00"
# $colornames = "Indigo", "Pink", "Magenta", "Dark Turquoise", "Dark Cyan", "Blue Violet", "Purple", "Sky Blue", "Slate Blue", "Medium Spring Green"

# See [Posh-Git Customization Variables](https://github.com/dahlbyk/posh-git?tab=readme-ov-file#customization-variables)
# "...On Performance" section for large repos causing terminal latency

# Sets the default directory the shell will open in (this will force this dir, so, not great if opening files from multiple drives)
# Set-Location C:\Users\User\Dev


# _/END_INITIAL_
# ****************************
# ****************************


# ****************************
#  **************************
#  ** ** * _PROMPTS_ * ** **
#  **************************
# ****************************
# _START_

$presuffix = $colors | Get-Random
$postsuffix = $colors | Get-Random

# GitPromptSettings [API Documentation](https://github.com/dahlbyk/posh-git/wiki/Customizing-Your-PowerShell-Prompt#v1x---customizing-the-posh-git-prompt)

# Customizing Git-Posh-Prompt settings (`prompt` fn will overwrite if exists)

# change below to `$true` to abbreviate Home to `~` e.g. `~\Dev\profiles\` instead of `C:\Users\User\Dev\profiles\`
$GitPromptSettings.DefaultPromptAbbreviateHomeDirectory = $false

# Adjust .Text properties with ASCII characters to customize
$GitPromptSettings.DefaultPromptPrefix.Text = "::"

# to split prompt into two lines
# $GitPromptSettings.AfterText += "`n"

$GitPromptSettings.DefaultPromptBeforeSuffix.Text += "\:: ~"

$GitPromptSettings.DefaultPromptPrefix.ForegroundColor = $presuffix
$GitPromptSettings.DefaultPromptPath.ForegroundColor = $postsuffix
$GitPromptSettings.DefaultPromptBeforeSuffix.ForegroundColor = $presuffix
$GitPromptSettings.DefaultPromptSuffix.ForegroundColor = $presuffix

$GitPromptSettings.IndexColor.ForegroundColor = $delimcolors[0]
$GitPromptSettings.WorkingColor.ForegroundColor = $delimcolors[2]


# _/END_PROMPTS_
# ****************************
# ****************************


# ****************************
#  **************************
#  ** ** * _HELPERS_ * ** **
#  **************************
# ****************************
# _START_

# PowerShell parameter completion shim for the dotnet CLI (tab auto-complete)
Register-ArgumentCompleter -Native -CommandName dotnet -ScriptBlock {
  param($wordToComplete, $commandAst, $cursorPosition)
      dotnet complete --position $cursorPosition "$commandAst" | ForEach-Object {
          [System.Management.Automation.CompletionResult]::new($_, $_, 'ParameterValue', $_)
      }
}

# Fn for `touch` like Bash `touch`
function touch
{
    $file = $args[0]
    if ($null -eq $file) {
        throw "No filename supplied"
    }

    if (Test-Path $file)
    {
        throw "File already exists"
    }
    else
    {
        # echo $null > $file
        New-Item -ItemType File -Name ($file)
    }
}

# Gets and prints most recent commit to remote
function gitLatestCommitUrl {
    return "$($(git config --get remote.origin.url) -ireplace '\.git$', '')/commit/$(git rev-parse HEAD)"
}

# Set-Alias cannot receive arguments for the cmdlet or function it will call, so we need to make a fn that scripts the arguments
function listall {
    Get-ChildItem -Force
}

function copyDirToClip {
    param (
        [Parameter(Mandatory=$false)]
        [string]$Dir = "."
    )
    $Path = (Get-Item $Dir).FullName
    $Path | Set-Clipboard
    Write-Output "Copied $Path to Clipboard."
}

function runAsAdmin {
    Powershell -Command "Start-Process cmd -Verb RunAs -ArgumentList '/k cd /d %CD% && %&'"
}

# Aliases (from Unix)
Set-Alias ls-a listall
Set-Alias cp-dir copyDirToClip
Set-Alias sudo runAsAdmin


# _/END_HELPERS_
# ****************************
# ****************************