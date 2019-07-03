## Variables
$SiteName = "SiteName"
$SiteAddress = "ConnectionIPorDNSName"
$User = "UserName"
$Password = "UserPassword"
$SharedSecret = "SharedSecretPassword"
$WifiNetwork1 = "NA"
$WifiNetwork2 = "NA"
$WifiNetwork3 = "NA"
$WifiNetwork4 = "NA"
$WifiNetwork5 = "NA"

## Run Script
$SiteNameLower = $SiteName.ToLower()
$OutputEncoding = [System.Text.Encoding]::UTF8
$Output = @"
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
  <key>PayloadContent</key>
  <array>

    <!-- Home: Manual -->
    <dict>
      <key>UserDefinedName</key>
      <string>($SiteName): Manual</string>
      <key>PayloadDisplayName</key>
      <string>Home: Manual</string>
      <key>PayloadIdentifier</key>
      <string>com.$SiteNameLower.vpn.manual</string>
      <key>PayloadUUID</key>
      <string>EE68308C-FB8C-4209-9F5A-629755244190</string>
      <key>VPNType</key>
      <string>L2TP</string>
      <key>IPSec</key>
      <dict>
        <key>AuthenticationMethod</key>
        <string>SharedSecret</string>
        <key>LocalIdentifierType</key>
        <string>KeyID</string>
        <key>SharedSecret</key>
        <string>$SharedSecret</string>
      </dict>
      <key>PPP</key>
      <dict>
        <key>AuthName</key>
        <string>$User</string>
        <key>AuthPassword</key>
        <string>$Password</string>
        <key>CommRemoteAddress</key>
        <string>$SiteAddress</string>
      </dict>
      <key>OverridePrimary</key>
      <true/>
      <key>IPv4</key>
      <dict>
        <key>OverridePrimary</key>
        <integer>1</integer>
      </dict>
      <key>PayloadType</key>
      <string>com.apple.vpn.managed</string>
      <key>PayloadVersion</key>
      <integer>1</integer>
    </dict>

    <!-- Home: WiFi -->
    <dict>
      <key>UserDefinedName</key>
      <string>($SiteName): WiFi</string>
      <key>PayloadDisplayName</key>
      <string>Home: WiFi</string>
      <key>PayloadIdentifier</key>
      <string>com.$SiteNameLower.wifi</string>
      <key>PayloadUUID</key>
      <string>21549F1D-0662-4111-8230-0F8BFD706090</string>
      <key>VPNType</key>
      <string>L2TP</string>
      <key>IPSec</key>
      <dict>
        <key>AuthenticationMethod</key>
        <string>SharedSecret</string>
        <key>LocalIdentifierType</key>
        <string>KeyID</string>
        <key>SharedSecret</key>
        <string>$SharedSecret</string>
      </dict>
      <key>PPP</key>
      <dict>
        <key>AuthName</key>
        <string>$User</string>
        <key>AuthPassword</key>
        <string>$Password</string>
        <key>CommRemoteAddress</key>
        <string>$SiteAddress</string>
      </dict>
      <key>OnDemandEnabled</key>
      <integer>1</integer>
      <key>OnDemandRules</key>
      <array>
        <dict>
          <key>InterfaceTypeMatch</key>
          <string>WiFi</string>
          <key>SSIDMatch</key>
          <array>
            <string>$WifiNetwork1</string>
            <string>$WifiNetwork2</string>
			<string>$WifiNetwork3</string>
			<string>$WifiNetwork4</string>
			<string>$WifiNetwork5</string>
          </array>
          <key>Action</key>
          <string>Disconnect</string>
        </dict>
        <dict>
          <key>InterfaceTypeMatch</key>
          <string>WiFi</string>
          <key>Action</key>
          <string>Connect</string>
        </dict>
        <dict>
          <!-- VPN Default state -->
          <key>Action</key>
          <string>Disconnect</string>
        </dict>
      </array>
      <key>OverridePrimary</key>
      <true/>
      <key>IPv4</key>
      <dict>
        <key>OverridePrimary</key>
        <integer>1</integer>
      </dict>
      <key>PayloadType</key>
      <string>com.apple.vpn.managed</string>
      <key>PayloadVersion</key>
      <integer>1</integer>
    </dict>


    <!-- Home: Always -->
    <dict>
      <key>UserDefinedName</key>
      <string>($SiteName): Always</string>
      <key>PayloadDisplayName</key>
      <string>Home: Always</string>
      <key>PayloadIdentifier</key>
      <string>com.$SiteNameLower.vpn.always</string>
      <key>PayloadUUID</key>
      <string>6011F604-73E7-4473-8811-FDBB3AE8FBE5</string>
      <key>VPNType</key>
      <string>L2TP</string>
      <key>IPSec</key>
      <dict>
        <key>AuthenticationMethod</key>
        <string>SharedSecret</string>
        <key>LocalIdentifierType</key>
        <string>KeyID</string>
        <key>SharedSecret</key>
        <string>$SharedSecret</string>
      </dict>
      <key>PPP</key>
      <dict>
        <key>AuthName</key>
        <string>$User</string>
        <key>AuthPassword</key>
        <string>$Password</string>
        <key>CommRemoteAddress</key>
        <string>$SiteAddress</string>
      </dict>
      <key>OnDemandEnabled</key>
      <integer>1</integer>
      <key>OnDemandRules</key>
      <array>
        <dict>
          <!-- VPN Default state -->
          <key>Action</key>
          <string>Connect</string>
        </dict>
      </array>
      <key>OverridePrimary</key>
      <true/>
      <key>IPv4</key>
      <dict>
        <key>OverridePrimary</key>
        <integer>1</integer>
      </dict>
      <key>PayloadType</key>
      <string>com.apple.vpn.managed</string>
      <key>PayloadVersion</key>
      <integer>1</integer>
    </dict>

  </array>
  <key>PayloadDisplayName</key>
  <string>$SiteName On-Demand VPN Profiles</string>
  <key>PayloadIdentifier</key>
  <string>TW.BAB78424-28FB-4654-915D-93D0CB87CC7B</string>
  <key>PayloadRemovalDisallowed</key>
  <false/>
  <key>PayloadType</key>
  <string>Configuration</string>
  <key>PayloadUUID</key>
  <string>A9F4B095-4336-4ECD-A2B2-3D52D778E743</string>
  <key>PayloadVersion</key>
  <integer>1</integer>
</dict>
</plist>
"@

$Output | Out-File .\VPNConfiguration-$SiteName.mobileconfig -Encoding utf8