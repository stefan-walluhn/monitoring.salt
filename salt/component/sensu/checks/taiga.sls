include:
  - component.sensu.client

check_taiga:
  file.serialize:
    - name: /etc/sensu/conf.d/check_taiga.json
    - dataset:
        checks:
          taiga_check_http:
            command: check-http.rb -u https://taiga.neuland.io
            interval: 120
            priority: major
            occurrences: 2
            subscribers:
              - satellite
          taiga_check_api:
            command: check-http-json.rb -u https://taiga.neuland.io/api/v1/ -K auth -v "https://taiga.neuland.io/api/v1/auth"
            interval: 120
            priority: major
            occurrences: 2
            subscribers:
              - satellite
          taiga_check_cert:
            command: check-https-cert.rb -u https://taiga.neuland.io -w 30 -k 15
            interval: 43200
            priority: informal
            subscribers:
              - cert
    - formatter: JSON
    - watch_in:
      - service: sensu_client
