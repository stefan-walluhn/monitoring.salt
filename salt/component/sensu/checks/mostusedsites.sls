include:
  - component.sensu.client

check_mostusedsites:
  file.serialize:
    - name: /etc/sensu/conf.d/check_mostusedsites.json
    - dataset:
        checks:
          mostusedsites_check_backend:
            command: check-http-json.rb -u https://api.mostusedsites.guerilla-it.net/stats -K state -v ok
            interval: 120
            priority: major
            occurrences: 2
            subscribers:
              - satellite
          mostusedsites_check_cert:
            command: check-https-cert.rb -u https://api.mostusedsites.guerilla-it.net -w 30 -k 15
            interval: 43200
            priority: informal
            subscribers:
              - cert
    - formatter: JSON
    - watch_in:
      - service: sensu_client
