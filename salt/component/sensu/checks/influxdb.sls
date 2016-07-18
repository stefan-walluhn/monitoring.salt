include:
  - component.sensu.client

check_influxdb:
  file.serialize:
    - name: /etc/sensu/conf.d/check_influxdb.json
    - dataset:
        checks:
          check_influxdb:
            command: check-influxdb.rb
            interval: 120
            priority: minor
            occurrences: 2
            subscribers:
              - influxdb
    - formatter: JSON
    - watch_in:
      - service: sensu_client
