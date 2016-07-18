include:
  - component.sensu.client

check_physical:
  file.serialize:
    - name: /etc/sensu/conf.d/check_physical.json
    - dataset:
        checks:
          check_raid:
            command: check-raid.rb
            interval: 120
            priority: major
            subscribers:
              - raid
          metrics_io:
            command: metrics-iostat-extended.rb
            interval: 120
            handler: influxdb
            subscribers:
              - physical
    - formatter: JSON
    - watch_in:
      - service: sensu_client
