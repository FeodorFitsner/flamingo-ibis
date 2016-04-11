reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyServer /t REG_SZ /d 10.240.0.29:8888 /f

$source=@"

[DllImport("wininet.dll")]

public static extern bool InternetSetOption(int hInternet, int dwOption, int lpBuffer, int dwBufferLength);  

"@

#Create type from source

$wininet = Add-Type -memberDefinition $source -passthru -name InternetSettings

#INTERNET_OPTION_PROXY_SETTINGS_CHANGED
$wininet::InternetSetOption([IntPtr]::Zero, 95, [IntPtr]::Zero, 0)|out-null

#INTERNET_OPTION_REFRESH
$wininet::InternetSetOption([IntPtr]::Zero, 37, [IntPtr]::Zero, 0)|out-null

[Net.ServicePointManager]::SecurityProtocol = 'Tls12'
Invoke-WebRequest https://canhazip.com

$mavenConfig = '<settings xmlns="http://maven.apache.org/SETTINGS/1.0.0"
  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://maven.apache.org/SETTINGS/1.0.0
                  http://maven.apache.org/xsd/settings-1.0.0.xsd">

  <proxies>
    <proxy>
      <active>true</active>
      <protocol>http</protocol>
      <host>10.240.0.29</host>
      <port>8888</port>
    </proxy>
  </proxies>

</settings>'

New-Item "$env:USERPROFILE\.m2" -ItemType Directory -Force
Set-Content "$env:USERPROFILE\.m2\settings.xml" -Value $mavenConfig
