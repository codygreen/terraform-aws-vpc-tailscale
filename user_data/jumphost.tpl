#cloud-config
---
update_hostname: ${hostname}
package_update: true
package_upgrade: true
apt:
  preserve_sources_list: false
  sources:
    tailscale.list:
      source: deb https://pkgs.tailscale.com/stable/ubuntu focal main
      keyid: 2596A99EAAB33821893C0A79458CA832957F5868
packages: 
  - tailscale
runcmd:
  - hostnamectl set-hostname ${hostname}
  - [tailscale, up, -ssh, -authkey, ${tailscale_auth_key}, -hostname, ${hostname}]
  