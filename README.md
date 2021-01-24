# RTOVMSetup
## Windows

### 1. Install Boxstarter
```
. { Invoke-WebRequest -useb https://boxstarter.org/bootstrapper.ps1 } | iex; Get-Boxstarter -Force
```

### 2. Install Boxstarter Package
```
$Cred = Get-Credential $env:USERNAME
Install-BoxstarterPackage -PackageName https://raw.githubusercontent.com/ZeroPointSecurity/RTOVMSetup/master/win10.choco -Credential $Cred
```

## Kali
```
kali@kali:~$ curl -sS https://raw.githubusercontent.com/ZeroPointSecurity/RTOVMSetup/master/kali.sh | sudo bash -
```
