include:
  - component.sensu.client

check_test:
  file.serialize:
    - name: /etc/sensu/conf.d/check_test.json
    - dataset:
        checks:
          check_test:
            command: check-http.rb -u http://kotti.walluhn.de -q 'Test Instance'
            interval: 120
            priority: critical
            occurrences: 2
            subscribers:
              - satellite
    - formatter: JSON
    - watch_in:
      - service: sensu_client
