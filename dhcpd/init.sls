# check to see if the DHCPServer is installed
# {% if salt['service.available']('DHCPServer') %}
stop and delete the service:
  service.dead:
    - name: DHCPServer
  module.run:
    - service.delete:
      - name: DHCPServer
# {% endif %}

create the 'tools' directory:
  file.directory:
    - name: C:/tools
  archive.extracted:
    - name: C:/tools/dhcpd
    - source_hash: 'sha256=24a9794ab6a47b8e7650af1748d881e77dd739858013cca64af8e731904f376c'
    - source: 'http://www.dhcpserver.de/cms/wp-content/plugins/download-attachments/includes/download.php?id=625'
    - if_missing: C:/tools/dhcpd
    - archive_format: zip
    - enforce_toplevel: False
  
run the server and configure:
  file.managed:
    - source: 'salt://dhcpd/files/dhcpsrv.ini.jinja'
    - name: 'C:/tools/dhcpd/dhcpsrv.ini'
    - defaults:
        dns_servers:
          - 1.1.1.1
          - 8.8.8.8
          - 10.10.4.31
          - 165.245.4.211
    - template: jinja
  cmd.run:
    - name: 'C:/tools/dhcpd/dhcpsrv.exe -install -configfirewall'
  service.running:
    - name: 'DHCPServer'

