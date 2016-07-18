include:
  - component.sensu.client

check_glsa:
  file.serialize:
    - name: /etc/sensu/conf.d/check_gentoo.json
    - dataset:
        checks:
          check_glsa:
            command: /usr/lib/nagios/plugins/check_glsa2.sh
            interval: 86400
            priority: minor
            subscribers:
              - gentoo
    - formatter: JSON
    - watch_in:
      - service: sensu_client
