include:
  - component.sensu.client

check_postfix:
  file.serialize:
    - name: /etc/sensu/conf.d/check_postfix.json
    - dataset:
        checks:
          check_postfix_queue:
            command: check-mailq.rb -w 10 -c 20
            interval: 120
            priority: major
            subscribers:
              - postfix
          metrics_postfix_queue:
            command: metrics-mailq.rb
            interval: 120
            type: metric
            handler: influxdb
            subscribers:
              - postfix
    - formatter: JSON
    - watch_in:
      - service: sensu_client
