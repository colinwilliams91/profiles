# Powershell Profile Scripts

_I made these scripts to customize the Windows Powershell Terminal_
_Each script will also list what they achieve at the top of the file_
_PS has basically no Tab autocomplete which is lame..._
_These scripts will incrementally fix this_

## Purpose
- Git CLI autocomplete
- Dotnet CLI autocomplete
- Git tracking; status, remote, branch, and commit info
- Cute colors 😽

### `sans_git_posh.profile.ps1`
- Template from user tamj0rd2 [stack overflow](https://stackoverflow.com/a/44411205/20575174)
  - _Somewhat_ achieves Posh-Git Git CLI Status :heavy_check_mark:
  - _Does not_ enable tab autocomplete for Git CLI :x:
  - _Does not_ enable tab autocomplete for Dotnet CLI :x:
  - _Implements_ a cute color array and selects 2 random colors for command line on ps launch (`prompt()`) 🦝

### `posh_git_home_dev.profile.ps1`
- Template for install Posh-Git Module I use for Dev work on my Home machine [API Documentation](https://github.com/dahlbyk/posh-git/wiki/Customizing-Your-PowerShell-Prompt#v1x---customizing-the-posh-git-prompt)
  - _Implements_ Posh-Git for all Git tracking :heavy_check_mark:
  - _Does_ enable tab autocomplete for Git CLI :heavy_check_mark:
  - _Does_ enable tab autocomplete for Dotnet CLI :heavy_check_mark:
  - _Implements_ a cute color array and selects 2 random colors for command line on ps launch (`prompt()`) 🐯

## To Use
- Create the file: `code $PROFILE.AllUsersAllHosts`<sup>1</sup>
- Install posh-git:
    - first time install: `PowerShellGet\Install-Module posh-git -Scope CurrentUser -Force`
    - if installed, update: `PowerShellGet\Update-Module posh-git`
- Copy the contents of the `*.profile.ps1` file you choose into newly created `profile.ps1`
- Update the `Set-Location C:\Users\User\Dev` line to your Home directory (or leave it commented out)

<sup>1</sup>**There are four different levels of profile persistence you can create:**
- If you want your profile script available in all your PowerShell hosts (console, ISE, etc) run this command `code $PROFILE.CurrentUserAllHosts`
- If you want your profile script available in just the current host, run this command `code $PROFILE.CurrentUserCurrentHost`
- If you want your profile script available for all users on the system, run this command `code $PROFILE.AllUsersAllHosts`
- If you want your profile script available for all users but only for the current host, run this command `code $PROFILE.AllUsersCurrentHost`

_See [step 2 of these docs](https://github.com/dahlbyk/posh-git?tab=readme-ov-file#step-2-import-posh-git-from-your-powershell-profile) for more info_