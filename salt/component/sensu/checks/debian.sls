include:
  - component.sensu.client

check_apt:
  file.serialize:
    - name: /etc/sensu/conf.d/check_debian.json
    - dataset:
        checks:
          check_apt:
            command: /usr/lib/nagios/plugins/negate --warning='OK' -t 120 /usr/lib/nagios/plugins/check_apt -t 120
            interval: 86400
            priority: minor
            subscribers:
              - debian
    - formatter: JSON
    - watch_in:
      - service: sensu_client
