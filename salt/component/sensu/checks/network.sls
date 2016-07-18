include:
  - component.sensu.client

check_network:
  file.serialize:
    - name: /etc/sensu/conf.d/check_network.json
    - dataset:
        checks:
          check_netstat_tcp:
            command: check-netstat-tcp.rb -w 100 -c 200
            interval: 120
            occurrences: 2
            subscribers:
              - network
          metrics_netstat_tcp:
            command: metrics-netstat-tcp.rb
            interval: 120
            type: metric
            handler: influxdb
            subscribers:
              - network
          metrics_net:
            command: metrics-net.rb
            interval: 120
            type: metric
            handler: influxdb
            subscribers:
              - network
    - formatter: JSON
    - watch_in:
      - service: sensu_client

check_satellite:
  file.serialize:
    - name: /etc/sensu/conf.d/check_satellite.json
    - dataset:
        checks:
          check_ping_ovh:
            command: check-ping.rb -c 5 -h ovh.walluhn.de
            interval: 120
            occurrences: 3
            subscribers:
              - satellite
          check_ping_he:
            command: check-ping.rb -c 5 -h he.walluhn.de
            interval: 120
            occurrences: 3
            subscribers:
              - satellite
          check_ping6_ovh:
            command: check-ping.rb -6 -c 5 -h ovh.walluhn.de
            interval: 120
            occurrences: 3
            subscribers:
              - satellite
          check_ping6_he:
            command: check-ping.rb -6 -c 5 -h he.walluhn.de
            interval: 120
            occurrences: 3
            subscribers:
              - satellite
    - formatter: JSON
    - watch_in:
      - service: sensu_client
