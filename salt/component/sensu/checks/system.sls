include:
  - component.sensu.client

check_system:
  file.serialize:
    - name: /etc/sensu/conf.d/check_system.json
    - dataset:
        checks:
          check_disk_usage:
            command: check-disk-usage.rb -p /export -x tracefs,autofs
            interval: 120
            subscribers:
              - system
          check_load:
            command: check-load.rb
            interval: 120
            occurences: 2
            subscribers:
              - system
          check_memory:
            command: check-memory.rb
            interval: 120
            subscribers:
              - system
          metrics_cpu:
            command: metrics-cpu.rb
            type: metric
            interval: 120
            handler: influxdb
            subscribers:
              - system
          metrics_disk_usage:
            command: metrics-disk-usage.rb
            type: metric
            interval: 120
            handler: influxdb
            subscribers:
              - system
          metrics_memory:
            command: metrics-memory.rb
            type: metric
            interval: 120
            handler: influxdb
            subscribers:
              - system
          metrics_load:
            command: metrics-load.rb
            type: metric
            interval: 120
            handler: influxdb
            subscribers:
              - system
    - formatter: JSON
    - watch_in:
      - service: sensu_client
