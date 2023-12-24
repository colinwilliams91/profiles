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
  - _Implements_ a cute color array and selects 2 random colors for command line on ps launch (`prompt()`)

### `posh_git_home_dev.profile.ps1`
- Template for install Posh-Git Module I use for Dev work on my Home machine [API Documentation](https://github.com/dahlbyk/posh-git/wiki/Customizing-Your-PowerShell-Prompt#v1x---customizing-the-posh-git-prompt)
  - _Implements_ Posh-Git for all Git tracking :heavy_check_mark:
  - _Does_ enable tab autocomplete for Git CLI :heavy_check_mark:
  - _Does_ enable tab autocomplete for Dotnet CLI :heavy_check_mark:
  - _Implements_ a cute color array and selects 2 random colors for command line on ps launch (`prompt()`)
