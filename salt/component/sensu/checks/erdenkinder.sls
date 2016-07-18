include:
  - component.sensu.client

check_erdenkinder:
  file.serialize:
    - name: /etc/sensu/conf.d/check_erdenkinder.json
    - dataset:
        checks:
          erdenkinder_check_http:
            command: check-http.rb -R https://www.erdenkinder.eu/ -u http://www.erdenkinder.eu
            interval: 120
            priority: major
            occurrences: 2
            subscribers:
              - satellite
          erdenkinder_check_https:
            command: check-http.rb -s -u https://www.erdenkinder.eu -q Kindergarten
            interval: 120
            priority: major
            occurrences: 2
            subscribers:
              - satellite
          erdenkinder_check_cert:
            command: check-https-cert.rb -u https://www.erdenkinder.eu -w 30 -k 15
            interval: 43200
            priority: informal
            subscribers:
              - cert
    - formatter: JSON
    - watch_in:
      - service: sensu_client
